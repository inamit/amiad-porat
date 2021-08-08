import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'user.dart';

class Student extends User {
  final String phone;
  final int grade;
  final String group;
  final List<String> subjects;

  Student(
      {required String firstName,
      required String lastName,
      required this.grade,
      required String birthdate,
      required this.phone,
      required this.subjects,
      required this.group})
      : super(firstName: firstName, lastName: lastName, birthdate: birthdate);

  Student copyWith(
      {String? firstName,
      String? lastName,
      int? grade,
      String? birthdate,
      String? phone,
      String? email,
      List<String>? subjects,
      String? group,
      String? type}) {
    return Student(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        grade: grade ?? this.grade,
        birthdate: birthdate ?? this.birthdate,
        phone: phone ?? this.phone,
        subjects: subjects ?? this.subjects,
        group: group ?? this.group);
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'grade': grade,
      'birthdate': birthdate,
      'phone': phone,
      'subjects': subjects,
      'group': group
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
        firstName: map['firstName'],
        lastName: map['lastName'],
        grade: map['grade'],
        birthdate: map['birthdate'],
        phone: map['phone'],
        subjects: List<String>.from(map['subjects']),
        group: map['group']);
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Student(firstName: $firstName, lastName: $lastName, grade: $grade, birthdate: $birthdate, phone: $phone, subjects: $subjects, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Student &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.grade == grade &&
        other.birthdate == birthdate &&
        other.phone == phone &&
        listEquals(other.subjects, subjects) &&
        other.group == group;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        grade.hashCode ^
        birthdate.hashCode ^
        phone.hashCode ^
        subjects.hashCode ^
        group.hashCode;
  }
}
