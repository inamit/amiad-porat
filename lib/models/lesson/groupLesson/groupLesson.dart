import '../absLesson.dart';

class GroupLesson extends AbsLesson {
  String? teacher;

  GroupLesson(
      {required String subject, String? this.teacher, required DateTime date})
      : super(lessonType: 'שיעור', subject: subject, date: date);

  @override
  String get title =>
      teacher != null ? super.title + " עם ${teacher}" : super.title;
}
