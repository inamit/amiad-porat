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
    print(uid);
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
}
