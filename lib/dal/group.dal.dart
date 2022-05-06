import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'user.dal.dart';

import '../models/lesson/groupLesson/groupLesson.dart';

import '../models/group/group.dart';
import '../models/user/user.dart';

class GroupDal {
  static Future<Group?> getGroup(String groupId) async {
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

    Group? group = await getGroup(groupId);

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
          subject: group.subject,
          teacher: user?.firstName,
          date: groupLessonDate);
    }

    return groupLesson;
  }
}
