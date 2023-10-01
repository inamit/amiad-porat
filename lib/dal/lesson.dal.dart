import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../models/lesson/tutorLesson/lesson.dart';
import '../models/lesson/tutorLesson/studentStatus.dart';
import '../models/subjects.dart';

class LessonDal {
  static Future<List<Lesson>?> getScheduledLessonsFromDateByUser(String uid,
      DateTime date) async {
    Map<String, String> student = new Map();
    student.putIfAbsent('student', () => uid);
    student.putIfAbsent('status',
        () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

    try {
      QuerySnapshot<Lesson> lessons = await FirebaseFirestore.instance
          .collection('lessons')
          .where('date', isGreaterThan: date)
          .where('students', arrayContains: student)
          .withConverter(
              fromFirestore: LessonCollectionReference.fromFirestore,
              toFirestore: LessonCollectionReference.toFirestore)
          .get();

      return lessons.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (error) {
      FirebaseCrashlytics.instance.log(
          "Tried to fetch all scheduled lessons for student: ${uid} from date: ${DateTime.now()}");
      FirebaseCrashlytics.instance.recordError(error, error.stackTrace,
          reason: "Finding the closest lesson");

      throw error;
    }

    return null;
  }

  static Future<List<Lesson>> getLessonByUserAndDate(
      String uid, DateTime date) async {
    Map<String, String> student = new Map();
    student.putIfAbsent('student', () => uid);
    student.putIfAbsent('status',
        () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

    QuerySnapshot<Lesson> lessons = await FirebaseFirestore.instance
        .collection('lessons')
        .where('date', isEqualTo: date)
        .where('students', arrayContains: student)
        .withConverter(
            fromFirestore: LessonCollectionReference.fromFirestore,
            toFirestore: LessonCollectionReference.toFirestore)
        .get();

    return lessons.docs.map((e) => e.data()).toList();
  }

  static Future<List<Lesson>> getLessonByUserAndDateRangeAndSubject(String uid,
      DateTime startDate, DateTime endDate, Subjects subject) async {
    Map<String, String> student = new Map();
    student.putIfAbsent('student', () => uid);
    student.putIfAbsent('status',
        () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

    QuerySnapshot<Lesson> lessons = await FirebaseFirestore.instance
        .collection('lessons')
        .where('date', isGreaterThanOrEqualTo: startDate)
        .where('date', isLessThanOrEqualTo: endDate)
        .where('students', arrayContains: student)
        .where('subject', isEqualTo: SubjectsHelper().getValue(subject))
        .withConverter(
            fromFirestore: LessonCollectionReference.fromFirestore,
            toFirestore: LessonCollectionReference.toFirestore)
        .get();

    return lessons.docs.map((e) => e.data()).toList();
  }
}
