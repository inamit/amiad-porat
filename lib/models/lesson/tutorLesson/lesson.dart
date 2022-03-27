import '../absLesson.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson extends AbsLesson {
  @TimestampConverter()
  final DateTime date;
  final bool isOpen;
  final String subject;
  final List<Map<String, String>> students;

  Lesson(
      {required this.date,
      required this.isOpen,
      required this.subject,
      required this.students})
      : super(lessonType: 'תגבור', subject: subject, date: date);
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
