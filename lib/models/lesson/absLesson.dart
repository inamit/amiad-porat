import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants.dart';
import '../subjects.dart';

abstract class AbsLesson {
  @JsonKey(ignore: true)
  String lessonType;
  String subject;
  DateTime date;

  get isRecurring;

  AbsLesson(
      {required this.lessonType, required this.subject, required this.date});

  String get title =>
      "${lessonType} ב${SubjectsHelper().getHebrew(this.getSubject!)}";
  Subjects? get getSubject => SubjectsHelper().getEnum(this.subject);
  Color get color => getSubject == Subjects.Math ? mathColor : englishColor;
}
