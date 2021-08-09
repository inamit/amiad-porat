import 'dart:ui';

import 'package:amiadporat/router/routes.dart';

import 'screens/login_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/constants.dart';
import 'screens/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("he", "IL"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      routes: routes,
      initialRoute: SplashScreen.route,
      onGenerateRoute: (settings) {
        if (settings.name == LoginScreen.route) {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => LoginScreen(),
            transitionDuration: Duration(milliseconds: 2000),
          );
        }
      },
      locale: Locale("he", "IL"),
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: neonBlueMaterial,
          fontFamily: "Heebo",
          appBarTheme:
              AppBarTheme(backgroundColor: neonBlue, centerTitle: true)),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
