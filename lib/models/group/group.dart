import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
);

@firestoreSerializable
class Group {
  @Id()
  final String id;
  final String name;
  final int dayInWeek;
  final String hour;
  final String subject;
  final String teacher;

  TimeOfDay get getHour => TimeOfDay(
      hour: int.parse(hour.split(':')[0]),
      minute: int.parse(hour.split(':')[1]));

  Group({required this.id,
    required this.name,
      required this.dayInWeek,
      required this.hour,
      required this.subject,
      required this.teacher});
}

@Collection<Group>('groups')
final groupsRef = GroupCollectionReference();
