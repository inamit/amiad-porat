import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lesson/groupLesson/groupLesson.dart';
import '../models/lesson/tutorLesson/lesson.dart';
import '../models/lesson/tutorLesson/studentStatus.dart';
import '../models/lesson_block.dart';
import '../models/subjects.dart';
import '../models/user/user.dart';
import 'group.dal.dart';
import 'lesson.dal.dart';

class LessonScheduler {
  static Future<bool> _hasGroupLesson(MyUser student, DateTime date) async {
    bool hasGroupLesson = false;

    student.group!.forEach((element) async {
      if (!hasGroupLesson) {
        GroupLesson? groupLesson = await GroupDal.getGroupLesson(element!);
        hasGroupLesson = date == groupLesson!.date;
      }
    });

    return hasGroupLesson;
  }

  static Future<bool> _hasLesson(String uid, DateTime date) async {
    return (await LessonDal.getLessonByUserAndDate(uid, date)).length > 0;
  }

  static Future<bool> _isStudentFree(
      MyUser student, String uid, DateTime date) async {
    bool hasGroupLesson = (await _hasGroupLesson(student, date));
    bool hasLesson = (await _hasLesson(uid, date));

    return !hasGroupLesson && !hasLesson;
  }

  static Future<String?> _getFirstLessonIdByDateAndSubject(
      DateTime lessonDate, Subjects subject) async {
    String? lessonId;

    QuerySnapshot<Lesson> lessons = await FirebaseFirestore.instance
        .collection('lessons')
        .where('date', isEqualTo: lessonDate)
        .where('isOpen', isEqualTo: true)
        .where('subject', isEqualTo: SubjectsHelper().getValue(subject))
        .withConverter(
            fromFirestore: LessonCollectionReference.fromFirestore,
            toFirestore: LessonCollectionReference.toFirestore)
        .get();

    if (lessons.docs.isNotEmpty) {
      for (QueryDocumentSnapshot<Lesson> lesson in lessons.docs) {
        if (lesson.data().maxStudents > lesson.data().students.length) {
          lessonId = lesson.id;
          break;
        }
      }
    }

    return lessonId;
  }

  static Future<bool> _hasLessonToday(
      String uid, DateTime date, Subjects subject) async {
    DateTime startDate = DateTime(date.year, date.month, date.day);
    DateTime endDate = DateTime(date.year, date.month, date.day + 1);

    List<Lesson> lessons =
        await LessonDal.getLessonByUserAndDateRangeAndSubject(
            uid, startDate, endDate, subject);

    return lessons.length > 0;
  }

  static Future<ScheduleLessonsResponse> addStudentToLessons(
      MyUser user, String uid, List<LessonBlock> lessons) async {
    Map<String, String> student = new Map();
    student.putIfAbsent('student', () => uid);
    student.putIfAbsent('status',
        () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

    ScheduleLessonsResponse response = ScheduleLessonsResponse();

    // #region Check for student availability
    for (LessonBlock lesson in lessons) {
      bool isStudentFree =
          await _isStudentFree(user, uid, lesson.selectedDate!);

      if (!isStudentFree) {
        response.addToFailedLessons(lesson);
      }
    }
    // #endregion

    if (response.failedLessons.length > 0) {
      response.isStudentFree = false;
      response.failureReason = "אוי לא! נראה שכבר קבעת משהו באחד התאריכים.";
    } else {
      response.isStudentFree = true;

      // #region Check for scheduled lessons in the same day
      for (LessonBlock lesson in lessons) {
        bool hasLessonToday = await _hasLessonToday(
            uid, lesson.selectedDate!, lesson.selectedSubject);

        if (hasLessonToday) {
          response.addToFailedLessons(lesson);
          response.failureReason =
              "נראה שכבר קבעת תגבור ביום זה. שווה לנסות לדבר עם המשרד!";
        }
      }
      // #endregion

      if (response.failedLessons.length == 0) {
        WriteBatch batch = FirebaseFirestore.instance.batch();

        for (LessonBlock lesson in lessons) {
          String? lessonId = await _getFirstLessonIdByDateAndSubject(
              lesson.selectedDate!, lesson.selectedSubject);

          if (lessonId != null) {
            batch.update(lessonsRef.doc(lessonId).reference, {
              "students": FieldValue.arrayUnion([student])
            });
          } else {
            response.addToFailedLessons(lesson);
            response.failureReason =
                "לא הצלחנו לקבוע ${response.failedLessons.length} תגבורים.";
          }
        }

        await batch.commit();
      }
    }

    return response;
  }
}

class ScheduleLessonsResponse {
  List<LessonBlock> _failedLessons = [];
  bool _isStudentFree = false;
  String? _failureReason;

  ScheduleLessonsResponse();

  List<LessonBlock> get failedLessons => this._failedLessons;
  bool get isStudentFree => this._isStudentFree;
  String? get failureReason => this._failureReason;

  addToFailedLessons(LessonBlock lessonBlock) {
    _failedLessons.add(lessonBlock);
  }

  set isStudentFree(value) => this._isStudentFree = value;
  set failureReason(value) => this._failureReason = value;
}
