import 'package:amiadporat/screens/components/template.dart';
import 'package:amiadporat/screens/login_screen/login_screen.dart';
import 'package:amiadporat/screens/schedule_lessons/schedule_lessons.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Template.route: (context) => Template(),
  LoginScreen.route: (context) => LoginScreen(),
  ScheduleLessons.route: (context) => ScheduleLessons()
};
