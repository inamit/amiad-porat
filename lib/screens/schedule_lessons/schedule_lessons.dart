import 'dart:async';

import '../../dal/lessonScheduler.dart';
import 'package:intl/intl.dart';

import '../../providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/constants.dart';
import '../../models/lesson_block.dart';
import 'components/add_lesson_block.dart';

class ScheduleLessons extends StatefulWidget {
  const ScheduleLessons({Key? key}) : super(key: key);

  static const String route = "/student/schedule";

  @override
  _ScheduleLessonsState createState() => _ScheduleLessonsState();
}

class _ScheduleLessonsState extends State<ScheduleLessons> {
  late AuthProvider authService;
  List<LessonBlock> lessons = [];

  bool valid = false;
  bool isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    authService = Provider.of<AuthProvider>(context, listen: false);
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
              validateForm: this.validateForm);
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
        onPressed: () async {
          if (validateForm()) {
            if (authService.status == Status.Authenticated) {
              setState(() {
                this.isLoading = true;
              });

              ScheduleLessonsResponse response =
                  await LessonScheduler.addStudentToLessons(
                      (await authService.user)!,
                      authService.uid!,
                      this.lessons);

              setState(() {
                this.isLoading = false;
              });
              if (response.failedLessons.length > 0) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(response.failureReason!),
                  action: !response.isStudentFree
                      ? SnackBarAction(
                          label: "מתי קבעתי?",
                          onPressed: () {
                            showFailedLessonsAlert(response);
                          },
                        )
                      : null,
                ));
              } else {
                Navigator.pop(context, true);
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("הייתה בעיה. נסה שנית מאוחר יותר"),
              ));
              Navigator.of(context).pop();
            }
          } else {
            // Form is not valid.
          }
        },
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                "קבענו! \n ניפגש במרכז",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }

  showFailedLessonsAlert(ScheduleLessonsResponse response) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("התגבורים והשיעורים שלי"),
            content: Container(
              width: 100,
              // height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: response.failedLessons.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          "${DateFormat("EEE dd/MM/yyyy hh:mm", 'he_IL').format(response.failedLessons[index].selectedDate!)}"),
                    );
                  }),
            ),
          );
        });
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
