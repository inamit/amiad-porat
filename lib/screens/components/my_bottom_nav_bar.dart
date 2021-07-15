import 'package:amiadporat/screens/schedule_lessons/schedule_lessons.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "דף הבית"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined), label: "לוז שבועי")
          ],
          selectedItemColor: neonBlue,
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
        child: Icon(Icons.add),
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ScheduleLessons()));
      },
    );
  }
}
