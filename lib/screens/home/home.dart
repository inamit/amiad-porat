import 'package:amiadporat/data/lessons.dart';
import 'package:amiadporat/data/messages.dart';
import 'package:amiadporat/data/tests.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../components/my_bottom_nav_bar.dart';
import 'components/homepage_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('שלום, עמית'),
      ),
      bottomNavigationBar: MyBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomepageCard(
                  content:
                      lessons.isEmpty ? noLessonMessage() : noLessonMessage(),
                  button: buildButton("לחיצה קטנה כאן וזה מטופל", () {}),
                  color: orange),
              HomepageCard(
                  content: tests.isEmpty ? noTestMessage() : noTestMessage(),
                  button: buildButton("לחיצה פה ונתקדם לציון טוב", () {}),
                  color: red),
              HomepageCard(
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
            ],
          ),
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
      padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(neonBlue),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "עוד לא קבעת תגבורים לשבוע הקרוב",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Image.asset("assets/emoji.png"),
        ],
      ),
    );
  }
}
