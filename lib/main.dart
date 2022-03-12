import 'dart:ui';

import 'package:amiadporat/auth_widget_builder.dart';
import 'package:amiadporat/providers/auth_provider.dart';
import 'package:amiadporat/router/routes.dart';
import 'package:amiadporat/screens/components/template.dart';
import 'package:amiadporat/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/constants.dart';
import 'screens/splash_screen/splash_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440, 3040),
      builder: () => MaterialApp(
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
        home: FutureBuilder(
          future: Future.wait(
              [Firebase.initializeApp(), Future.delayed(Duration(seconds: 2))]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Consumer<AuthProvider>(builder: (_, authProviderRef, __) {
                return AuthWidgetBuilder(
                    builder: (BuildContext context,
                        AsyncSnapshot<MyUser?> userSnapshot) {
                      if (userSnapshot.connectionState ==
                          ConnectionState.done) {
                        return userSnapshot.hasData && userSnapshot.data != null
                            ? Template()
                            : LoginScreen();
                      }

                      return Material(
                        child: CircularProgressIndicator(),
                      );
                    },
                    key: Key('AuthWidget'));
              });
            }

            return SplashScreen();
          },
        ),
      ),
    );
  }
}
