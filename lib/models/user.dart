import 'package:amiadporat/models/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  final String uid;
  final String email;
  String? firstName;
  String? lastName;
  String? birthdate;
  String? phone;

  static final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");
  MyUser(
      {required this.email,
      required this.uid,
      required this.firstName,
      required this.lastName,
      required this.birthdate,
      this.phone});

  static Future<MyUser> fromFirebaseUser(User user) async {
    // TODO: Get info from firestore
    final idTokenResult = await user.getIdTokenResult(true);
    switch (idTokenResult.claims?['role']) {
      case 'student':
        Student student = Student.fromFirebaseUser(user);
        await student.addInfoFromFirestore();

        return student;
      default:
        throw new Exception('Cannot initialize user');
    }
  }

  addInfoFromFirestore() async {
    DocumentSnapshot userInfo =
        await MyUser._usersCollection.doc(this.uid).get();

    this.firstName = userInfo['firstName'];
    this.lastName = userInfo['lastName'];
    this.birthdate = userInfo['birthDate'];
    this.phone = userInfo['phoneNo'];
  }
}
