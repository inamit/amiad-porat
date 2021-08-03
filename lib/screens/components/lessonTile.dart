import '../../models/lesson_block.dart';
import '../../models/subjects.dart';
import '../home/components/homepage_card.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({Key? key, required this.lesson}) : super(key: key);
  final LessonBlock lesson;
  @override
  Widget build(BuildContext context) {
    return HomepageCard(
        color:
            lesson.selectedSubject == Subjects.Math ? mathColor : englishColor,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _lessonDetails(
            lesson.selectedSubject,
            lesson.selectedDay!,
          ),
        ));
  }

  Row _lessonDetails(Subjects selectedSubject, DateTime hour) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(
            selectedSubject == Subjects.Math ? mathIcon : englishIcon,
            size: 64,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${hour.hour}:${hour.minute.toString().padLeft(2, '0')}-${hour.hour + 1}:${hour.minute.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 18),
            )
          ],
        )
      ],
    );
  }
}
