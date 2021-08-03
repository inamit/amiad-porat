import 'dart:async';

import 'package:flutter/material.dart';

import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  void navigate() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (_, __, ___) => new LoginScreen(),
      transitionDuration: Duration(milliseconds: 2000),
    ));
  }
}
