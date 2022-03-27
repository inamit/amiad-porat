import '../models/user/user.dart';

class UserDal {
  static getUserById(String id) {
    usersRef.doc(id);
  }
}
