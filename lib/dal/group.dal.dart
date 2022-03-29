import '../models/lesson/groupLesson/groupLesson.dart';

import '../models/group/group.dart';

class GroupDal {
  static Future<GroupLesson?> getGroupLesson(String groupId) async {
    GroupLesson? groupLesson = null;
    GroupDocumentSnapshot groupSnapshot = await groupsRef.doc(groupId).get();

    Group? group = groupSnapshot.data;

    if (group != null) {
      int day = DateTime.now().day;

      if (DateTime.now().weekday > group.dayInWeek) {
        day += (7 - DateTime.now().weekday) + group.dayInWeek;
      } else if (DateTime.now().weekday < group.dayInWeek) {
        day += group.dayInWeek - DateTime.now().weekday;
      } else if (DateTime.now().hour >= group.getHour.hour &&
          DateTime.now().minute >= group.getHour.minute) {
        day += 7;
      }

      DateTime groupLessonDate = new DateTime(DateTime.now().year,
          DateTime.now().month, day, group.getHour.hour, group.getHour.minute);

      groupLesson = GroupLesson(
          subject: group.subject,
          teacher: group.teacher,
          date: groupLessonDate);
    }

    return groupLesson;
  }
}
