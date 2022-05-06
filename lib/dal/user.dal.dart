import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../models/user/user.dart';

class UserDal {
  static Future<MyUser?> getUserById(String id) async {
    try {
      MyUserDocumentSnapshot user = await usersRef.doc(id).get();
      return user.data;
    } on FirebaseException catch (error) {
      FirebaseCrashlytics.instance.log("Trying to get user with id: ${id}");
      FirebaseCrashlytics.instance.setUserIdentifier(
          FirebaseAuth.instance.currentUser?.uid ?? "NOT SIGNED IN");
      FirebaseCrashlytics.instance
          .recordError(error, error.stackTrace, reason: "Couldn't read user");
    }

    return null;
  }

  static Future<void> addFCMToUser(String? uid, String? token) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'fcmTokens': FieldValue.arrayUnion([token])
    });
  }
}
