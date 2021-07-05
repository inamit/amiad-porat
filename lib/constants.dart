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

const redOrangeGradient = [red, orange];
const whiteGreyGradient = [white, grey];

/// * Messages
