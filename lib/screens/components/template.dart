import 'dart:async';

import 'package:amiadporat/screens/login_screen/login_screen.dart';

import '../../providers/auth_provider.dart';
import 'package:provider/provider.dart';
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

  String name = "";
  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('שלום $name'),
        actions: [
          IconButton(
              onPressed: () async {
                AuthProvider authService =
                    Provider.of<AuthProvider>(context, listen: false);
                await authService.signOut();
                Navigator.of(context).pushReplacementNamed(LoginScreen.route);
              },
              icon: Icon(Icons.logout))
        ],
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

  String? getName() {
    final authService = Provider.of<AuthProvider>(context, listen: false);
    authService.user.then((user) {
      setState(() {
        this.name = user?.firstName ?? '';
      });
    });

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
