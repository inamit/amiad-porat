import 'package:amiadporat/dal/group.dal.dart';
import 'package:amiadporat/dal/lesson.dal.dart';
import 'package:amiadporat/models/lesson/groupLesson/groupLesson.dart';
import 'package:amiadporat/models/lesson_block.dart';
import 'package:amiadporat/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lesson/tutorLesson/lesson.dart';
import '../models/lesson/tutorLesson/studentStatus.dart';
import '../models/subjects.dart';

class LessonScheduler {
  static Future<bool> _hasGroupLesson(MyUser student, DateTime date) async {
    GroupLesson? groupLesson = await GroupDal.getGroupLesson(student.group);
    bool hasGroupLesson = true;

    if (groupLesson == null) {
      hasGroupLesson = false;
    } else {
      hasGroupLesson = date == groupLesson.date;
    }

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

  static Future<String?> getFirstLessonIdByDateAndSubject(
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
      lessonId = lessons.docs.first.id;
    }

    return lessonId;
  }

  static Future<ScheduleLessonsResponse> addStudentToLessons(
      MyUser user, String uid, List<LessonBlock> lessons) async {
    Map<String, String> student = new Map();
    student.putIfAbsent('student', () => uid);
    student.putIfAbsent('status',
        () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

    ScheduleLessonsResponse response = ScheduleLessonsResponse();

    for (LessonBlock lesson in lessons) {
      bool isStudentFree =
          await _isStudentFree(user, uid, lesson.selectedDate!);

      if (!isStudentFree) {
        response.addToFailedLessons(lesson);
      }
    }

    if (response.failedLessons.length == 0) {
      response.isStudentFree = true;

      WriteBatch batch = FirebaseFirestore.instance.batch();

      for (LessonBlock lesson in lessons) {
        String? lessonId = await getFirstLessonIdByDateAndSubject(
            lesson.selectedDate!, lesson.selectedSubject);

        if (lessonId != null) {
          batch.update(lessonsRef.doc(lessonId).reference, {
            "students": FieldValue.arrayUnion([student])
          });
        } else {
          response.addToFailedLessons(lesson);
        }
      }

      await batch.commit();
    } else {
      response.isStudentFree = false;
    }

    return response;
  }
}

class ScheduleLessonsResponse {
  List<LessonBlock> _failedLessons = [];
  bool _isStudentFree = false;

  ScheduleLessonsResponse();

  List<LessonBlock> get failedLessons => this._failedLessons;
  bool get isStudentFree => this._isStudentFree;

  addToFailedLessons(LessonBlock lessonBlock) {
    _failedLessons.add(lessonBlock);
  }

  set isStudentFree(value) => this._isStudentFree = value;
}
