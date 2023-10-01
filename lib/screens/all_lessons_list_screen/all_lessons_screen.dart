import 'package:amiadporat/store/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

import '../../models/lesson/absLesson.dart';
import '../components/lessonTile.dart';

class AllLessons extends StatefulWidget {
  const AllLessons({Key? key}) : super(key: key);

  @override
  _AllLessonsState createState() => _AllLessonsState();
}

class _AllLessonsState extends State<AllLessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("כל התגבורים שלי"),
        ),
        body: StoreConnector(
          converter: (Store<AppState> store) {
            return [
              ...store.state.lessonsState.lessons.values,
              ...store.state.groupsState.groups.values
            ];
          },
          builder: (BuildContext context, List<AbsLesson> values) {
            return GroupedListView<AbsLesson, DateTime>(
              elements: values,
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
            );
          },
        ));
  }
}
