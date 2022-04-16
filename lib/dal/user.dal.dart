import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user/user.dart';

class UserDal {
  static Future<MyUser?> getUserById(String id) async {
    MyUserDocumentSnapshot user = await usersRef.doc(id).get();
    return user.data;
  }

  static Future<void> addFCMToUser(String? uid, String? token) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'fcmTokens': FieldValue.arrayUnion([token])
    });
  }
}
