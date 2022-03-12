import 'dart:convert';

import 'user.dart';

class Office extends MyUser {
  Office(
      {required String uid,
      required String email,
      required String firstName,
      required String lastName,
      required String birthdate})
      : super(
            uid: uid,
            email: email,
            firstName: firstName,
            lastName: lastName,
            birthdate: birthdate);

  factory Office.fromMap(Map<String, dynamic> map) {
    return Office(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        birthdate: map['birthdate']);
  }

  factory Office.fromJson(String source) => Office.fromMap(json.decode(source));
}
