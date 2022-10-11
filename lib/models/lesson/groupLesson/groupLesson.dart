import '../absLesson.dart';

class GroupLesson extends AbsLesson {
  String? teacher;

  static get groupLessonType => 'שיעור';

  GroupLesson(
      {required String subject, String? this.teacher, required DateTime date})
      : super(
            lessonType: GroupLesson.groupLessonType,
            subject: subject,
            date: date);

  @override
  String get title =>
      teacher != null ? super.title + " עם ${teacher}" : super.title;
}
