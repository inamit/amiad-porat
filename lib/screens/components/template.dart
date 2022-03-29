import 'dart:async';

import 'mainPage.dart';

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
  List<Widget> pages = [];
  List<GlobalKey<MainPageState>> pagesKeys = [GlobalKey(), GlobalKey()];

  String name = "";
  @override
  void initState() {
    getName();

    pages.add(Home(key: pagesKeys[0]));
    pages.add(WeeklySchedule(
      key: pagesKeys[1],
    ));

    super.initState();
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

  void getName() async {
    final authService = Provider.of<AuthProvider>(context, listen: false);

    this.name = (await authService.user)?.firstName ?? '';
  }

  FutureOr onGoBack(dynamic value) {
    pagesKeys[_selectedIndex].currentState?.refreshData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
