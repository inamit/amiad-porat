import 'package:amiadporat/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Status {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated,
  Registering
}

class AuthProvider extends ChangeNotifier {
  //Firebase Auth object
  late FirebaseAuth _auth;

  //Default status
  Status _status = Status.Uninitialized;

  Status get status => _status;

  Future<MyUser?> get user => _userFromFirebase(_auth.currentUser);
  // Stream<MyUser?> get user => _auth.authStateChanges().map(_userFromFirebase);

  AuthProvider() {
    //initialise object
    _auth = FirebaseAuth.instance;

    //listener for authentication changes such as user sign in and sign out
    _auth.authStateChanges().listen(onAuthStateChanged);
  }

  //Create user object based on the given User
  Future<MyUser?> _userFromFirebase(User? user) async {
    if (user == null) {
      return null;
      // throw new Exception('User was not found');
    }

    return MyUser.fromFirebaseUser(user);
  }

  //Method to detect live auth changes such as user sign in and sign out
  Future<void> onAuthStateChanged(User? firebaseUser) async {
    print(firebaseUser);
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _userFromFirebase(firebaseUser);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  //Method to handle user sign in using email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print("Error on the sign in = " + e.toString());
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  //Method to handle password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //Method to handle user signing out
  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
