import 'package:amiadporat/constants.dart';
import 'package:amiadporat/models/lesson_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/add_lesson_block.dart';

class ScheduleLessons extends StatefulWidget {
  const ScheduleLessons({Key? key}) : super(key: key);

  @override
  _ScheduleLessonsState createState() => _ScheduleLessonsState();
}

class _ScheduleLessonsState extends State<ScheduleLessons> {
  List<LessonBlock> lessons = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      this.lessons.add(LessonBlock());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("קביעת תגבורים חדשים"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                _buildListView(context),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: _buildAddButton(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: _buildSubmitButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildListView(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height / 3) * 2,
      child: ListView.builder(
        itemCount: this.lessons.length,
        itemBuilder: (context, index) {
          return AddLessonBlock(
              onDeletePressed: () {
                if (this.lessons.length > 1) {
                  setState(() {
                    this.lessons.removeAt(index);
                  });
                }
              },
              lesson: this.lessons[index]);
        },
      ),
    );
  }

  Container _buildSubmitButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
          onPressed: () {
            if (validateForm()) {
              this.lessons.forEach((element) {
                print(element);
              });
            } else {
              print("COMPLETE FORM");
            }
          },
          child: Text(
            "קבענו! \n ניפגש במרכז",
            textAlign: TextAlign.center,
          )),
    );
  }

  ElevatedButton _buildAddButton() {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          backgroundColor: MaterialStateProperty.all(neonBlue),
          shadowColor: MaterialStateProperty.all(Colors.black)),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Icon(Icons.add),
      ),
      onPressed: () {
        setState(() {
          this.lessons.add(LessonBlock());
        });
      },
    );
  }

  bool validateForm() {
    bool valid = true;
    this.lessons.forEach((lesson) {
      if (!lesson.isValid()) {
        valid = false;
      }
    });

    return valid;
  }
}
