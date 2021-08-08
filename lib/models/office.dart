import 'dart:convert';

import 'user.dart';

class Office extends User {
  Office(
      {required String firstName,
      required String lastName,
      required String birthdate})
      : super(firstName: firstName, lastName: lastName, birthdate: birthdate);

  factory Office.fromMap(Map<String, dynamic> map) {
    return Office(
        firstName: map['firstName'],
        lastName: map['lastName'],
        birthdate: map['birthdate']);
  }

  factory Office.fromJson(String source) => Office.fromMap(json.decode(source));
}
