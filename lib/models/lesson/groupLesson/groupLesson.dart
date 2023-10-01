import '../absLesson.dart';

class GroupLesson extends AbsLesson {
  String id;
  String? teacher;

  static get groupLessonType => 'שיעור';

  get isRecurring => true;

  GroupLesson({required String this.id,
    required String subject,
    String? this.teacher,
    required DateTime date})
      : super(
            lessonType: GroupLesson.groupLessonType,
            subject: subject,
            date: date);

  @override
  String get title =>
      teacher != null ? super.title + " עם ${teacher}" : super.title;
}
