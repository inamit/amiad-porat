import '../models/user/user.dart';

class UserDal {
  static Future<MyUser?> getUserById(String id) async {
    MyUserDocumentSnapshot user = await usersRef.doc(id).get();
    return user.data;
  }
}
