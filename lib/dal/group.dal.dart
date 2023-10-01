import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../models/group/group.dart';
import '../models/lesson/groupLesson/groupLesson.dart';
import '../models/user/user.dart';
import 'user.dal.dart';

class GroupDal {
  static Future<Group?> _getGroup(String groupId) async {
    GroupDocumentSnapshot? groupSnapshot;

    try {
      groupSnapshot = await groupsRef.doc(groupId).get();
    } on FirebaseException catch (error) {
      FirebaseCrashlytics.instance.log("Trying to access group id: ${groupId}");
      FirebaseCrashlytics.instance.setUserIdentifier(
          FirebaseAuth.instance.currentUser?.uid ?? 'NOT SIGNED IN');
      FirebaseCrashlytics.instance
          .recordError(error, error.stackTrace, reason: "Couldn't read group");
      print(error);
    }

    return groupSnapshot?.data;
  }

  static Future<GroupLesson?> getGroupLesson(String groupId) async {
    GroupLesson? groupLesson = null;

    Group? group = await _getGroup(groupId);

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

      MyUser? user = await UserDal.getUserById(group.teacher);

      groupLesson = GroupLesson(
          id: group.id,
          subject: group.subject,
          teacher: user?.firstName,
          date: groupLessonDate);
    }

    return groupLesson;
  }

  static Future<List<GroupLesson?>> getGroupLessonsByUser(
      Future<MyUser?> user) async {
    return Future.wait((await user)!.group!.map((e) => getGroupLesson(e)));
  }
}
