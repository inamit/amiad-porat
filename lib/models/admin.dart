import 'dart:convert';

import 'user.dart';

class Admin extends User {
  final List<String> subjects;

  Admin(
      {required String firstName,
      required String lastName,
      required String birthdate,
      required this.subjects})
      : super(firstName: firstName, lastName: lastName, birthdate: birthdate);

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      firstName: map['firstName'],
      lastName: map['lastName'],
      birthdate: map['birthdate'],
      subjects: List<String>.from(map['subjects']),
    );
  }

  factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source));
}
