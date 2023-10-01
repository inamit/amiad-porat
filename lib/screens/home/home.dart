import 'dart:async';

import 'package:amiadporat/store/lessons/lessons.state.dart';
import 'package:amiadporat/store/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import '../../data/messages.dart';
import '../../data/tests.dart';
import '../../models/constants.dart';
import '../../models/lesson/absLesson.dart';
import '../../models/lesson/groupLesson/groupLesson.dart';
import '../../models/lesson/tutorLesson/lesson.dart';
import '../../models/subjects.dart';
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

  @override
  void initState() {
    authService = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  refreshData() {}

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => ({
              "lessons": store.state.lessonsState,
              "groups": store.state.groupsState
            }),
        builder: (BuildContext context, Map<String, dynamic> lessonsState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                HomepageCard(
                    content: getClosestLessonWidget(lessonsState["lessons"]),
                    button: !lessonsState["lessons"].isLoading &&
                            closestLesson == null
                        ? HomepageCard.buildCardButton(
                            "לקבוע תגבור?",
                            neonBlue,
                            () => Navigator.of(context)
                                .pushNamed(ScheduleLessons.route)
                                .then((_) => setState(() {})))
                        : Container(),
                    color: closestLesson?.color ?? orange),
                if (lessonsState["groups"].groups.isNotEmpty)
                  ...(lessonsState["groups"]
                      .groups
                      .values
                      .map((lesson) => HomepageCard(
                            content: _groupLesson(lesson!),
                            color: lesson!.color ?? orange,
                          ))),
                // if (groupLesson != null)
                //   ...groupLesson!.map((lesson) => HomepageCard(
                //         content: _groupLesson(lesson!),
                //         color: lesson!.color ?? orange,
                //       )),
                HomepageCard(
                    content: tests.isEmpty ? noTestMessage() : noTestMessage(),
                    button: HomepageCard.buildCardButton("רוצה לשתף?", neonBlue,
                        () {
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
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
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
        });
  }

  Widget getClosestLessonWidget(LessonsState lessonsState) {
    if (lessonsState.isLoading) {
      return _loadingLesson();
    } else {
      if (lessonsState.lessons.isEmpty) {
        return noLessonMessage();
      } else {
        // Get map the map called lessons from the state, sort it by the date and get the first lesson that its date is after now
        List<Lesson?> sortedLessonsFromNow = lessonsState.lessons.values
            .where((element) => element.date.isAfter(DateTime.now()))
            .toList()
          ..sort(
              (first, second) => first.date.difference(second.date).inMinutes);

        if (sortedLessonsFromNow.first == null) {
          return noLessonMessage();
        } else {
          closestLesson = sortedLessonsFromNow.first;
          return _closestLesson(closestLesson!);
        }
      }
    }
  }

  Widget _lesson(Row header, Widget details) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 8.0, bottom: 20.0),
      child: Column(
        children: [header, details],
      ),
    );
  }

  Widget _groupLesson(GroupLesson lesson) {
    return _lesson(_groupLessonHeader(lesson), _lessonDetails(lesson));
  }

  Widget _closestLesson(Lesson lesson) {
    return _lesson(_closestLessonHeader(), _lessonDetails(lesson));
  }

  Widget _loadingLesson() {
    return _lesson(
        _closestLessonHeader(showAction: false),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: CircularProgressIndicator()),
        ));
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

  Row _groupLessonHeader(GroupLesson lesson) {
    return _header(
        "שיעור ${SubjectsHelper().getHebrew(SubjectsHelper().getEnum(lesson.subject)!)} שלי:");
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

  Row _closestLessonHeader({bool showAction = true}) {
    return _header(
      "התגבור הקרוב שלי:",
      button: showAction
          ? TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AllLessons()));
              },
              child: Text(
                "כל התגבורים שלי",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : null,
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
