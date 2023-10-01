import 'package:amiadporat/dal/lesson.dal.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../dal/group.dal.dart';
import '../../models/lesson/absLesson.dart';
import '../../models/lesson/groupLesson/groupLesson.dart';
import '../../models/lesson/tutorLesson/lesson.dart';
import '../../models/user/user.dart';
import '../../providers/auth_provider.dart';
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
      List<Lesson>? lessons =
          await LessonDal.getScheduledLessonsFromDateByUser(authService.uid!);

      if (lessons != null) {
        setState(() {
          this.lessons = <AbsLesson>[...lessons];
        });
      }
    }
  }

  getGroupLesson() async {
    MyUser? user = await authService.user;

    if (user != null) {
      user.group!.forEach((element) async {
        GroupLesson? groupLesson = await GroupDal.getGroupLesson(element!);
        if (groupLesson != null) {
          setState(() {
            this.lessons.add(groupLesson);
          });
        }
      });
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
