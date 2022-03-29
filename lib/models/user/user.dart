import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

import 'userRoles.dart';

part 'user.g.dart';

@JsonSerializable()
class MyUser {
  final String firstName;
  final String lastName;
  final String phoneNo;
  final String birthDate;
  final int role;
  final String group;

  MyUser(
      {required this.firstName,
      required this.lastName,
      required this.phoneNo,
      required this.birthDate,
      required this.role,
      required this.group});

  UserRole? get getRole => UserRoleHelper().getEnum(this.role);
}

@Collection<MyUser>('users')
final usersRef = MyUserCollectionReference();
