import 'package:amiadporat/models/lesson/absLesson.dart';
import 'package:amiadporat/providers/auth_provider.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../dal/lesson.dal.dart';
import '../../data/lessons.dart';
import '../../models/group/group.dart';
import '../../models/lesson/groupLesson/groupLesson.dart';
import '../../models/lesson/tutorLesson/lesson.dart';
import '../../models/lesson/tutorLesson/studentStatus.dart';
import '../../models/user/user.dart';
import '../components/lessonTile.dart';

class AllLessons extends StatefulWidget {
  const AllLessons({Key? key}) : super(key: key);

  @override
  _AllLessonsState createState() => _AllLessonsState();
}

class _AllLessonsState extends State<AllLessons> {
  late AuthProvider authService;
  List<AbsLesson> lessons = [];

  @override
  void initState() {
    authService = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
    getMyLessons();
    getGroupLesson();
  }

  void getMyLessons() async {
    if (authService.status == Status.Authenticated) {
      Map<String, String> studentInfo = Map();
      studentInfo.putIfAbsent('student', () => authService.uid!);
      studentInfo.putIfAbsent('status',
          () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

      LessonQuerySnapshot snapshot =
          await lessonsRef.whereStudents(arrayContainsAny: [studentInfo]).get();

      setState(() {
        this.lessons = <AbsLesson>[
          ...snapshot.docs.map((e) => e.data).toList()
        ];
      });
    }
  }

  getGroupLesson() async {
    MyUser? user = await authService.user;

    if (user != null) {
      GroupDocumentSnapshot groupSnapshot =
          await groupsRef.doc(user.group).get();

      Group? group = groupSnapshot.data;

      if (group != null) {
        int day = DateTime.now().day;
        print(group.dayInWeek);

        if (DateTime.now().weekday > group.dayInWeek) {
          day += (7 - DateTime.now().weekday) + group.dayInWeek;
        } else if (DateTime.now().weekday < group.dayInWeek) {
          day += group.dayInWeek - DateTime.now().weekday;
        } else if (DateTime.now().hour >= group.getHour.hour &&
            DateTime.now().minute >= group.getHour.minute) {
          day += 7;
        }

        DateTime groupLessonDate = new DateTime(
            DateTime.now().year,
            DateTime.now().month,
            day,
            group.getHour.hour,
            group.getHour.minute);

        setState(() {
          this.lessons.add(new GroupLesson(
              subject: 'math', teacher: 'teacher', date: groupLessonDate));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("כל התגבורים שלי"),
        ),
        body: GroupedListView<AbsLesson, DateTime>(
          elements: lessons,
          groupBy: (AbsLesson lesson) => lesson.date,
          itemBuilder: (context, lesson) => LessonTile(
            lesson: lesson,
            title: lesson.title,
          ),
          groupSeparatorBuilder: (seperator) => Padding(
            padding: const EdgeInsets.only(right: 18.0, top: 20.0),
            child: Text(
              "${DateFormat('EEEE', 'he_IL').format(seperator)}, ${seperator.day}/${seperator.month}/${seperator.year}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
