import 'dart:async';

import '../../utils/db.dart';

import '../../models/constants.dart';
import '../../models/lesson_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/add_lesson_block.dart';
import '../../../data/lessons.dart';

class ScheduleLessons extends StatefulWidget {
  const ScheduleLessons({Key? key}) : super(key: key);

  static const String route = "/student/schedule";

  @override
  _ScheduleLessonsState createState() => _ScheduleLessonsState();
}

class _ScheduleLessonsState extends State<ScheduleLessons> {
  List<LessonBlock> lessons = [];

  bool valid = false;

  ScrollController _scrollController = new ScrollController();

  List<DateTime> dates = [];

  @override
  void initState() {
    super.initState();
    getDates();
    setState(() {
      this.lessons.add(LessonBlock());
    });
  }

  getDates() async {
    List<DateTime> temp = await DB().getLessonDates();

    setState(() {
      this.dates = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("קביעת תגבורים חדשים"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: neonBlue,
        onPressed: () {
          setState(() {
            this.lessons.add(LessonBlock());
          });
          this.validateForm();
          Timer(
              Duration(milliseconds: 100),
              () => this._scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut));
        },
        child: Icon(addIcon),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildListView(context),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 20.0,
                  ),
                  child: _buildSubmitButton(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: (MediaQuery.of(context).size.height / 3) * 2,
      ),
      child: ListView.builder(
        controller: this._scrollController,
        shrinkWrap: true,
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
            lesson: this.lessons[index],
            validateForm: this.validateForm,
            dates: this.dates,
          );
        },
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: valid ? Theme.of(context).primaryColor : Colors.grey),
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 2,
      child: TextButton(
        onPressed: () {
          if (validateForm()) {
            // TODO: CONNECT TO SERVER
            setState(() {
              lessonsData.addAll(this.lessons);
              lessonsData.sort((first, second) =>
                  first.selectedDay!.difference(second.selectedDay!).inMinutes);
            });

            this.lessons.forEach((element) {
              print(element);
            });

            Navigator.of(context).pop();
          } else {
            print("COMPLETE FORM");
          }
        },
        child: Text(
          "קבענו! \n ניפגש במרכז",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  bool validateForm() {
    bool valid = true;
    this.lessons.forEach((lesson) {
      if (!lesson.isValid()) {
        valid = false;
      }
    });

    setState(() {
      this.valid = valid;
    });

    return valid;
  }
}
