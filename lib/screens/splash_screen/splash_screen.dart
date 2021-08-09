import 'package:amiadporat/screens/components/template.dart';
import 'package:amiadporat/screens/login_screen/login_screen.dart';
import 'package:amiadporat/utils/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  initFirebase() async {
    FirebaseApp app = (await Future.wait(
        [Firebase.initializeApp(), Future.delayed(Duration(seconds: 2))]))[0];

    if (!AuthHandler().isLoggedIn()) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacementNamed(LoginScreen.route);
    } else {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacementNamed(Template.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: "Logo",
        child: Image.asset("assets/transparent_logo.png"),
      ),
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
