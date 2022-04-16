import 'dart:async';

import 'package:amiadporat/dal/user.dal.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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

    saveFCMToken();
  }

  saveFCMToken() async {
    AuthProvider authService =
        Provider.of<AuthProvider>(context, listen: false);
    String? token = await FirebaseMessaging.instance.getToken();

    await UserDal.addFCMToUser(authService.uid, token);

    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      UserDal.addFCMToUser(authService.uid, token);
    });
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

    String? firstName = (await authService.user)?.firstName ?? '';
    setState(() {
      this.name = firstName;
    });
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
