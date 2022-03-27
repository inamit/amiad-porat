import '../absLesson.dart';

class GroupLesson extends AbsLesson {
  String teacher;

  GroupLesson(
      {required String subject,
      required String this.teacher,
      required DateTime date})
      : super(lessonType: 'שיעור', subject: subject, date: date);

  @override
  String get title => super.title + " עם ${teacher}";
}
