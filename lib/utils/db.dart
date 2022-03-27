import 'package:flutter/material.dart';

import '../models/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DB {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static addLesson(DateTime date, String subject) {
    _firestore.collection('lessons').add({"date": date, "subject": subject});
  }

  static Future<List<DateTime>> getLessonDates(uid) async {
    List<DateTime> dates = [];

    DateTime now = DateTime.now().add(Duration(hours: 1));

    QuerySnapshot<Map<String, dynamic>> lessons = await _firestore
        .collection('lessons')
        .where('date', isGreaterThanOrEqualTo: now)
        // .where('date',
        //     isLessThanOrEqualTo: now.add(Duration(
        //         days: now.weekday < DateTime.thursday
        //             ? DateTime.thursday - now.weekday
        //             : DateTime.thursday)))
        // .where('isOpen', isEqualTo: true)
        .get();
    print(lessons);
    print(lessons.docs);

    lessons.docs.forEach((lesson) {
      print(lesson);
      print(lesson.data());
      List<dynamic> students = lesson.get("students");

      bool studentScheduled =
          students.any((element) => element["student"] == uid);

      if (!studentScheduled && students.length < lesson.get('maxStudents')) {
        dates.add(lesson.get("date").toDate());
      }
    });

    return dates;
  }

  static getLessonId(DateTime date) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> lessons =
        (await _firestore
                .collection('lessons')
                .where('date', isEqualTo: date)
                .get())
            .docs;

    String underMax = "";

    for (var doc in lessons) {
      if (doc.exists) {
        List<String> students = doc.get("students");

        if (students.length < MAX_STUDENTS) {
          if (students.length < MIN_STUDENTS) {
            return doc.id;
          }

          underMax = doc.id;
        }
      }
    }

    return underMax;
  }

  static addStudentToLesson(String uid, DateTime lessonDate) {
    _firestore.collection('lessons').doc(getLessonId(lessonDate)).update({
      "students": FieldValue.arrayUnion([uid])
    });
  }
}
