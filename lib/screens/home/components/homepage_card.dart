import 'package:flutter/material.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard({
    Key? key,
    required this.content,
    this.button,
    this.color,
    this.gradient,
  }) : super(key: key);

  final Widget content;
  final Widget? button;
  final Color? color;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            content,
            Align(
              alignment: Alignment.bottomLeft,
              child: button ?? Container(),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3.0),
                blurRadius: 5,
                spreadRadius: 2,
                color: Colors.black.withOpacity(0.3))
          ],
        ),
      ),
    );
  }

  static Padding buildCardButton(
      String title, Color backgroudColor, void Function() onPressed,
      {double width = 220}) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
      child: Container(
        height: 35,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(6.0),
            backgroundColor: MaterialStateProperty.all(backgroudColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}
