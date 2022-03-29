import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'providers/auth_provider.dart';
import 'router/routes.dart';
import 'screens/components/template.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/constants.dart';
import 'screens/splash_screen/splash_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LcwFwMeAAAAAE6CpkXyXHGFT2IDifldXUIySZsQ');

  if (kDebugMode) {
    String host = Platform.isAndroid ? '10.0.2.2' : 'localhost';

    FirebaseFirestore.instance.useFirestoreEmulator(host, 8082);

    await FirebaseAuth.instance.useAuthEmulator(host, 9099);

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }

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
          return null;
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
        // debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Future.wait([Future.delayed(Duration(seconds: 2))]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Consumer<AuthProvider>(builder: (_, authProviderRef, __) {
                if (authProviderRef.status == Status.Authenticated) {
                  return Template();
                }

                if (authProviderRef.status == Status.Unauthenticated ||
                    authProviderRef.status == Status.Authenticating) {
                  return LoginScreen();
                }

                return SplashScreen();
                // return FutureBuilder(
                //     future: authProviderRef.user,
                //     builder: ((context, userSnapshot) {
                //       if (userSnapshot.connectionState ==
                //           ConnectionState.done) {
                //         return (userSnapshot.hasData &&
                //                 userSnapshot.data != null)
                //             ? Template()
                //             : LoginScreen();
                //       }

                //       return SplashScreen();
                //     }));
                // return AuthWidgetBuilder(
                //     builder: (BuildContext context,
                //         AsyncSnapshot<MyUser?> userSnapshot) {
                //       if (userSnapshot.connectionState ==
                //           ConnectionState.done) {
                //         print("AUTH WIDGET BUILDER");
                //         return userSnapshot.hasData && userSnapshot.data != null
                //             ? Template()
                //             : LoginScreen();
                //       }

                //       return SplashScreen();
                //     },
                //     key: Key('AuthWidget'));
              });
            }

            return SplashScreen();
          },
        ),
      ),
    );
  }
}
