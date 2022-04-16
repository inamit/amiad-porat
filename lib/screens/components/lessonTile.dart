import '../../models/lesson/absLesson.dart';
import 'package:flutter/material.dart';

import '../../models/constants.dart';
import '../../models/subjects.dart';
import '../home/components/homepage_card.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({Key? key, required this.lesson, required this.title})
      : super(key: key);
  final AbsLesson lesson;
  final String title;
  @override
  Widget build(BuildContext context) {
    return HomepageCard(
        color: lesson.getSubject == Subjects.Math ? mathColor : englishColor,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _lessonDetails(
            lesson.getSubject,
            lesson.date,
          ),
        ));
  }

  Row _lessonDetails(Subjects? subject, DateTime lessonDate) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(
            subject == Subjects.Math ? mathIcon : englishIcon,
            size: 64,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              "${lessonDate.hour}:${lessonDate.minute.toString().padLeft(2, '0')}-${lessonDate.hour + 1}:${lessonDate.minute.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 18),
            )
          ],
        )
      ],
    );
  }
}
