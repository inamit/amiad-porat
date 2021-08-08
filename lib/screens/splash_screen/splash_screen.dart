import 'package:flutter/material.dart';

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
}
