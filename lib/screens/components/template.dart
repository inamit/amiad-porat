import 'dart:async';

import '../../models/student.dart';
import '../../utils/auth.dart';
import '../../utils/db.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';
import '../weekly_schedule/weekly_schedule.dart';
import 'my_bottom_nav_bar.dart';

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  static const String route = '/student/home';

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  int _selectedIndex = 0;
  List<Widget> pages = [Home(), WeeklySchedule()];

  Student? student;

  @override
  void initState() {
    getStudent();
    super.initState();
  }

  Future<void> getStudent() async {
    Student fetched = await DB().getStudentInfo(AuthHandler().currentUser!.uid);
    setState(() {
      student = fetched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('שלום, ${getName()}'),
      ),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
        onGoBack: onGoBack,
      ),
      body: SafeArea(
        child: pages[_selectedIndex],
      ),
    );
  }

  String getName() {
    if (this.student != null) {
      return this.student!.firstName;
    }

    return "";
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
