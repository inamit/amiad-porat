import 'dart:async';

import '../../models/subjects.dart';
import '../all_lessons_list_screen/all_lessons_screen.dart';
import 'package:flutter/material.dart';

import '../../models/constants.dart';
import '../../data/lessons.dart';
import '../../data/messages.dart';
import '../../data/tests.dart';
import '../../models/lesson_block.dart';
import '../schedule_lessons/schedule_lessons.dart';
import 'components/homepage_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<LessonBlock> lessons = lessonsData;
    return SingleChildScrollView(
      child: Column(
        children: [
          HomepageCard(
              content: lessons.isEmpty ? noLessonMessage() : _closestLesson(),
              button: lessons.isEmpty
                  ? buildButton(
                      "לקבוע תגבור?",
                      () => Navigator.of(context)
                          .pushNamed(ScheduleLessons.route)
                          .then((_) => setState(() {})))
                  : Container(),
              color: orange),
          HomepageCard(
              content: tests.isEmpty ? noTestMessage() : noTestMessage(),
              button: buildButton("רוצה לשתף?", () {}),
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

  Widget _closestLesson() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 8.0, bottom: 20.0),
      child: Column(
        children: [_closestLessonHeader(), _closestLessonDetails()],
      ),
    );
  }

  Row _closestLessonDetails() {
    List<String> days = ['ראשון', 'שני', 'שלישי', 'רביעי', 'חמישי'];

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(
            lessonsData[0].selectedSubject == Subjects.Math
                ? mathIcon
                : englishIcon,
            size: 64,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "יום ${days[lessonsData[0].selectedDay!.weekday]}, ${lessonsData[0].selectedDay!.day}/${lessonsData[0].selectedDay!.month}/${lessonsData[0].selectedDay!.year}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "שעה: ${lessonsData[0].selectedDay!.hour}:${lessonsData[0].selectedDay!.minute.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 18),
            )
          ],
        )
      ],
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  Row _closestLessonHeader() {
    return Row(
      children: [
        Text(
          "התגבור הקרוב שלי:",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        Expanded(child: Container()),
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AllLessons()));
          },
          child: Text(
            "כל התגבורים שלי",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
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
