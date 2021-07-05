import 'dart:convert';

import 'package:flutter/foundation.dart';

class Student {
  final String firstName;
  final String lastName;
  final String cClass;
  final String birthDate;
  final String phoneNumber;
  final String email;
  final List<String> subjects;
  final String group;
  Student({
    required this.firstName,
    required this.lastName,
    required this.cClass,
    required this.birthDate,
    required this.phoneNumber,
    required this.email,
    required this.subjects,
    required this.group,
  });

  Student copyWith({
    String? firstName,
    String? lastName,
    String? cClass,
    String? birthDate,
    String? phoneNumber,
    String? email,
    List<String>? subjects,
    String? group,
  }) {
    return Student(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      cClass: cClass ?? this.cClass,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      subjects: subjects ?? this.subjects,
      group: group ?? this.group,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'class': cClass,
      'birthDate': birthDate,
      'phoneNumber': phoneNumber,
      'email': email,
      'subjects': subjects,
      'group': group,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      firstName: map['firstName'],
      lastName: map['lastName'],
      cClass: map['class'],
      birthDate: map['birthDate'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      subjects: List<String>.from(map['subjects']),
      group: map['group'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Student(firstName: $firstName, lastName: $lastName, cClass: $cClass, birthDate: $birthDate, phoneNumber: $phoneNumber, email: $email, subjects: $subjects, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.cClass == cClass &&
      other.birthDate == birthDate &&
      other.phoneNumber == phoneNumber &&
      other.email == email &&
      listEquals(other.subjects, subjects) &&
      other.group == group;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      cClass.hashCode ^
      birthDate.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      subjects.hashCode ^
      group.hashCode;
  }
}