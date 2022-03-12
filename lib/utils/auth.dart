import 'package:firebase_auth/firebase_auth.dart';

class AuthHandler {
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthHandler._internal();
  static final AuthHandler _instance = AuthHandler._internal();

  factory AuthHandler() {
    return _instance;
  }

  User? get currentUser => auth.currentUser;

  bool isLoggedIn() => currentUser != null;

  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await this
          .auth
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      throw error;
    }
  }

  resetPasswordEmail(String email) async {
    await this.auth.sendPasswordResetEmail(email: email);
  }

  resetPassword(String email, String code, String password) async {
    String email = await this.auth.verifyPasswordResetCode(code);

    if (email == email) {
      this.auth.confirmPasswordReset(code: code, newPassword: password);
    }
  }
}
