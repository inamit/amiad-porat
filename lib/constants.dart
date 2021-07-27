import 'package:flutter/material.dart';

/// * Login constants
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "הכנס אימייל";
const String kInvalidEmailError = "כתובת האימייל לא תקינה";
const String kPassNullError = "הכנס סיסמה";
const String kShortPassError = "הסיסמה קצרה מידי";
const String kMatchPassError = "הסיסמאות לא תואמות";

/// * Colors
const red = Color(0xFFDC4B46);
const orange = Color(0xFFE67D3C);
const white = Color(0xFFF5F5F5);
const grey = Color(0xFFC1C1C1);
const neonBlue = Color(0xFF6D78FF);

MaterialColor neonBlueMaterial = MaterialColor(0xFF6D78FF, {
  50: Color(0xFF6D78FF).withOpacity(.1),
  100: Color(0xFF6D78FF).withOpacity(.2),
  200: Color(0xFF6D78FF).withOpacity(.3),
  300: Color(0xFF6D78FF).withOpacity(.4),
  400: Color(0xFF6D78FF).withOpacity(.5),
  500: Color(0xFF6D78FF).withOpacity(.6),
  600: Color(0xFF6D78FF).withOpacity(.7),
  700: Color(0xFF6D78FF).withOpacity(.8),
  800: Color(0xFF6D78FF).withOpacity(.9),
  900: Color(0xFF6D78FF).withOpacity(1)
});

const redOrangeGradient = [red, orange];
const whiteGreyGradient = [white, grey];

/// * Messages

/// * Icons
const mathIcon = Icons.calculate_outlined;
const englishIcon = Icons.explicit_outlined;
const homeIcon = Icons.home_outlined;
const weeklyScheduleIcon = Icons.calendar_today_outlined;
const addIcon = Icons.add;
const passwordIcon = Icons.lock;
const showPasswordIcon = Icons.visibility;
const hidePasswordIcon = Icons.visibility_off;
const mailIcon = Icons.mail;
const deleteIcon = Icons.delete;
