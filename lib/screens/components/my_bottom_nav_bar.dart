import 'dart:async';

import '../schedule_lessons/schedule_lessons.dart';
import 'package:flutter/material.dart';

import '../../models/constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
    required this.onGoBack,
  }) : super(key: key);

  final int selectedIndex;
  final void Function(int) onTap;
  final FutureOr Function(dynamic) onGoBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(homeIcon), label: "דף הבית"),
            BottomNavigationBarItem(
                icon: Icon(weeklyScheduleIcon), label: "לוז שבועי")
          ],
          selectedItemColor: neonBlue,
          currentIndex: selectedIndex,
          onTap: onTap,
        ),
        Positioned(
          // right: 140,
          bottom: 3,
          child: _buildAddButton(context),
        ),
      ],
    );
  }

  ElevatedButton _buildAddButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          backgroundColor: MaterialStateProperty.all(neonBlue),
          shadowColor: MaterialStateProperty.all(Colors.black)),
      child: Container(
        width: 90,
        height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Icon(addIcon),
      ),
      onPressed: () {
        Navigator.of(context)
            .pushNamed(ScheduleLessons.route)
            .then((value) => onGoBack);
      },
    );
  }
}
