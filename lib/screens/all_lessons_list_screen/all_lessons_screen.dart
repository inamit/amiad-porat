import '../../data/lessons.dart';
import '../../models/lesson_block.dart';
import '../components/lessonTile.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class AllLessons extends StatefulWidget {
  const AllLessons({Key? key}) : super(key: key);

  @override
  _AllLessonsState createState() => _AllLessonsState();
}

class _AllLessonsState extends State<AllLessons> {
  @override
  Widget build(BuildContext context) {
    const days = ['ראשון', 'שני', 'שלישי', 'רביעי', 'חמישי'];

    return Scaffold(
        appBar: AppBar(
          title: Text("כל התגבורים שלי"),
        ),
        body: GroupedListView<LessonBlock, DateTime>(
          elements: lessonsData,
          groupBy: (LessonBlock lesson) => lesson.selectedDate!,
          itemBuilder: (context, lesson) => LessonTile(lesson: lesson),
          groupSeparatorBuilder: (seperator) => Padding(
            padding: const EdgeInsets.only(right: 18.0, top: 20.0),
            child: Text(
              "${days[seperator.weekday]}, ${lessonsData[0].selectedDay!.day}/${seperator.month}/${seperator.year}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
