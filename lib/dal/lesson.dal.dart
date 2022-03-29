import 'package:amiadporat/models/subjects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lesson/tutorLesson/lesson.dart';
import '../models/lesson/tutorLesson/studentStatus.dart';

class LessonDal {
  static LessonQuery getLessonByUser(String uid) {
    Map<String, String> student = new Map();
    student.putIfAbsent('student', () => uid);
    student.putIfAbsent('status',
        () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

    return lessonsRef.whereStudents(arrayContainsAny: [student]);
  }

  static Future<Lesson?> getClosestLessonByUser(String uid) async {
    Map<String, String> student = new Map();
    student.putIfAbsent('student', () => uid);
    student.putIfAbsent('status',
        () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

    LessonQuerySnapshot querySnapshot =
        await lessonsRef.whereStudents(arrayContainsAny: [student]).get();

    List<LessonQueryDocumentSnapshot> lessons = querySnapshot.docs;
    lessons.sort(((a, b) => a.data.date.compareTo(b.data.date)));

    return lessons.length > 0 ? lessons[0].data : null;
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
