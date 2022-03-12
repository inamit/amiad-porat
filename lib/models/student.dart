import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'user.dart';

class Student extends MyUser {
  int? grade;
  String? group;
  List<dynamic>? subjects;

  Student(
      {required String uid,
      required String email,
      String? firstName,
      String? lastName,
      this.grade,
      String? birthdate,
      String? phone,
      this.subjects,
      this.group})
      : super(
            uid: uid,
            email: email,
            firstName: firstName,
            lastName: lastName,
            birthdate: birthdate,
            phone: phone);

  Student copyWith(
      {String? uid,
      String? firstName,
      String? lastName,
      int? grade,
      String? birthdate,
      String? phone,
      String? email,
      List<String>? subjects,
      String? group,
      String? type}) {
    return Student(
        uid: uid ?? this.uid,
        email: email ?? this.email,
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

  factory Student.fromMap(User user, Map<String, dynamic> map) {
    return Student(
        uid: user.uid,
        email: user.email!,
        firstName: map['firstName'],
        lastName: map['lastName'],
        grade: map['grade'],
        birthdate: map['birthdate'],
        phone: map['phone'],
        subjects: List<String>.from(map['subjects']),
        group: map['group']);
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source, User user) =>
      Student.fromMap(user, json.decode(source));

  factory Student.fromFirebaseUser(User user) => Student(
        uid: user.uid,
        email: user.email!,
      );

  @override
  addInfoFromFirestore() async {
    DocumentSnapshot userInfo = await FirebaseFirestore.instance
        .collection('users')
        .doc(this.uid)
        .get();

    this.firstName = userInfo['firstName'];
    this.lastName = userInfo['lastName'];
    this.birthdate = userInfo['birthDate'];
    this.phone = userInfo['phoneNo'];
    this.grade = userInfo['grade'];
    this.group = userInfo['group'];
    this.subjects = userInfo['subjects'];
  }

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
