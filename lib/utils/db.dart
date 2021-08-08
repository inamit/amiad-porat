import '../models/constants.dart';
import '../models/student.dart';
import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DB {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Student> getStudentInfo(String uid) async {
    DocumentSnapshot<Map<String, dynamic>?> studentInfo =
        await _firestore.collection('users').doc(uid).get();

    if (studentInfo.exists) {
      Map<String, dynamic> infoMap = studentInfo.data()!;
      infoMap["email"] = AuthHandler().currentUser!.email;
      Student student = Student.fromMap(infoMap);

      return student;
    } else {
      throw new Exception("לא ניתן לטעון את פרטי התלמיד");
    }
  }

  addLesson(DateTime date, String subject) {
    this
        ._firestore
        .collection('lessons')
        .add({"date": date, "subject": subject});
  }

  Future<List<DateTime>> getLessonDates() async {
    List<DateTime> dates = [];

    DateTime now = DateTime.now().add(Duration(hours: 1));

    QuerySnapshot<Map<String, dynamic>> lessons = await this
        ._firestore
        .collection('lessons')
        .where('date', isGreaterThanOrEqualTo: now)
        .where('date',
            isLessThanOrEqualTo: now.add(Duration(
                days: now.weekday < DateTime.thursday
                    ? DateTime.thursday - now.weekday
                    : DateTime.thursday)))
        .get();

    lessons.docs.forEach((lesson) {
      List<dynamic> students = lesson.get("students");

      if (!students.contains(AuthHandler().currentUser!.uid) &&
          students.length < 5) {
        dates.add(lesson.get("date").toDate());
      }
    });

    return dates;
  }

  getLessonId(DateTime date) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> lessons = (await this
            ._firestore
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

  addStudentToLesson(String uid, DateTime lessonDate) {
    this._firestore.collection('lessons').doc(getLessonId(lessonDate)).update({
      "students": FieldValue.arrayUnion([uid])
    });
  }
}
