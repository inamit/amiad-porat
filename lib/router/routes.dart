import 'package:flutter/widgets.dart';
import '../screens/components/template.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/schedule_lessons/schedule_lessons.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Template.route: (context) => Template(),
  LoginScreen.route: (context) => LoginScreen(),
  ScheduleLessons.route: (context) => ScheduleLessons(),
};
