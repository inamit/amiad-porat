import 'dart:async';

import 'package:amiadporat/screens/home/home.dart';
import 'package:amiadporat/screens/weekly_schedule/weekly_schedule.dart';
import 'package:flutter/material.dart';

import 'my_bottom_nav_bar.dart';

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  int _selectedIndex = 0;
  List<Widget> pages = [Home(), WeeklySchedule()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('שלום, עמית'),
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

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
