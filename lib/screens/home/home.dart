import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../dal/group.dal.dart';
import '../../dal/lesson.dal.dart';
import '../../data/messages.dart';
import '../../data/tests.dart';
import '../../models/constants.dart';
import '../../models/lesson/absLesson.dart';
import '../../models/lesson/groupLesson/groupLesson.dart';
import '../../models/lesson/tutorLesson/lesson.dart';
import '../../models/subjects.dart';
import '../../models/user/user.dart';
import '../../providers/auth_provider.dart';
import '../all_lessons_list_screen/all_lessons_screen.dart';
import '../components/mainPage.dart';
import '../schedule_lessons/schedule_lessons.dart';
import 'components/homepage_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends MainPageState<Home> {
  late AuthProvider authService;

  Lesson? closestLesson;
  GroupLesson? groupLesson;

  @override
  void initState() {
    authService = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  refreshData() {
    getLatestLesson();
    getGroupLesson();
  }

  getLatestLesson() async {
    if (authService.status == Status.Authenticated) {
      Lesson? lesson = await LessonDal.getClosestLessonByUser(authService.uid!);

      setState(() {
        this.closestLesson = lesson;
      });
    }
  }

  getGroupLesson() async {
    MyUser? user = await authService.user;

    if (user != null) {
      GroupLesson? groupLesson = await GroupDal.getGroupLesson(user.group!);

      setState(() {
        this.groupLesson = groupLesson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomepageCard(
              content:
                  closestLesson == null ? noLessonMessage() : _closestLesson(),
              button: closestLesson == null
                  ? buildButton(
                      "לקבוע תגבור?",
                      () => Navigator.of(context)
                          .pushNamed(ScheduleLessons.route)
                          .then((_) => setState(() {})))
                  : Container(),
              color: closestLesson?.color ?? orange),
          if (groupLesson != null)
            HomepageCard(
              content: _groupLesson(),
              color: groupLesson?.color ?? orange,
            ),
          HomepageCard(
              content: tests.isEmpty ? noTestMessage() : noTestMessage(),
              button: buildButton("רוצה לשתף?", () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "הפיצ'ר הזה עוד לא קיים לצערנו. בקרוב מאוד יהיה אפשר לשתף בקליק!")));
              }),
              color: red),
          Padding(
            padding: const EdgeInsets.only(bottom: 13.0),
            child: HomepageCard(
                content: messages.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "אין הודעות",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      )
                    : _messagesCardContent(),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: redOrangeGradient)),
          ),
        ],
      ),
    );
  }

  Widget _lesson(Row header, Row details) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 8.0, bottom: 20.0),
      child: Column(
        children: [header, details],
      ),
    );
  }

  Widget _groupLesson() {
    return _lesson(_groupLessonHeader(), _lessonDetails(this.groupLesson!));
  }

  Widget _closestLesson() {
    return _lesson(_closestLessonHeader(), _lessonDetails(this.closestLesson!));
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  Row _header(String title, {Widget? button}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        Expanded(child: Container()),
        button != null ? button : Container(),
      ],
    );
  }

  Row _groupLessonHeader() {
    return _header("השיעור שלי:");
  }

  Row _lessonDetails(AbsLesson lesson) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(
            lesson.getSubject == Subjects.Math ? mathIcon : englishIcon,
            size: 64,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${DateFormat('EEEE', 'he_IL').format(lesson.date)}, ${lesson.date.day}/${lesson.date.month}/${lesson.date.year}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "שעה: ${lesson.date.hour}:${lesson.date.minute.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 18),
            )
          ],
        )
      ],
    );
  }

  Row _closestLessonHeader() {
    return _header(
      "התגבור הקרוב שלי:",
      button: TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AllLessons()));
        },
        child: Text(
          "כל התגבורים שלי",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  List<Widget> _messages() {
    List<Widget> messagesWidget = [];

    for (String message in messages) {
      messagesWidget.add(Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child:
            Text(message, style: TextStyle(fontSize: 18, color: Colors.white)),
      ));
    }

    return messagesWidget;
  }

  Column _messagesCardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 10.0),
          child: Text("קצת הודעות חשובות:",
              style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _messages(),
          ),
        ),
      ],
    );
  }

  Padding noTestMessage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "מתי המבחן הקרוב שלך?",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Padding buildButton(String title, void Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
      child: Container(
        height: 35,
        width: 220,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(6.0),
            backgroundColor: MaterialStateProperty.all(neonBlue),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }

  Padding noLessonMessage() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/emoji.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אין לך עדיין תגבורים השבוע",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
