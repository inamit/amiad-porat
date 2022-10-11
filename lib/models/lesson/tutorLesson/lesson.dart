import 'package:amiadporat/models/lesson/tutorLesson/studentInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

import '../absLesson.dart';

part 'lesson.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
);

@firestoreSerializable
class Lesson extends AbsLesson {
  @Id()
  final String id;
  @TimestampConverter()
  final DateTime date;
  final bool isOpen;
  final String subject;
  final List<Map<String, String>> students;
  final int maxStudents;

  static get tutorLessonType => 'תגבור';

  Lesson(
      {required this.id,
      required this.date,
      required this.isOpen,
      required this.subject,
      required this.students,
      required this.maxStudents})
      : super(lessonType: Lesson.tutorLessonType, subject: subject, date: date);
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }
}

@Collection<Lesson>('lessons')
final lessonsRef = LessonCollectionReference();
