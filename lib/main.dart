import 'dart:io';

import 'package:amiadporat/dal/lesson.dal.dart';
import 'package:amiadporat/models/lesson/tutorLesson/lesson.dart';
import 'package:amiadporat/models/lesson/tutorLesson/studentStatus.dart';
import 'package:amiadporat/store/lessons/lessons.actions.dart';
import 'package:amiadporat/store/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'models/constants.dart';
import 'providers/auth_provider.dart';
import 'router/routes.dart';
import 'screens/components/template.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

Future<Store<AppState>> createStore() async {
  return Store(appReducer, initialState: AppState.initial());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var store = await createStore();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
    ],
    child: MyApp(
      store: store,
    ),
  ));
}

Future<FirebaseApp> initFirebase() async {
  final FirebaseApp _init = await Firebase.initializeApp();

  if (kDebugMode) {
    String host = Platform.isAndroid ? '10.0.2.2' : '127.0.0.1';

    FirebaseFirestore.instance.useFirestoreEmulator(host, 8082);

    await FirebaseAuth.instance.useAuthEmulator(host, 9099);

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseAppCheck.instance.activate(
        webProvider: new ReCaptchaV3Provider(
            '6LcwFwMeAAAAAE6CpkXyXHGFT2IDifldXUIySZsQ'));
    // await FirebaseAppCheck.instance.activate(
    //     webRecaptchaSiteKey: '6LcwFwMeAAAAAE6CpkXyXHGFT2IDifldXUIySZsQ');
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true);

  return _init;
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseInit = initFirebase();

    return StoreProvider(
      store: store,
      child: ScreenUtilInit(
        designSize: Size(1440, 3040),
        builder: (BuildContext c, _) => MaterialApp(
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale("he", "IL"),
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
              primarySwatch: neonBlueMaterial,
              fontFamily: "Heebo",
              appBarTheme:
                  AppBarTheme(backgroundColor: neonBlue, centerTitle: true)),
          // debugShowCheckedModeBanner: false,
          home: FutureBuilder(
            future: Future.wait([
              Future.delayed(Duration(seconds: 2)),
              _firebaseInit,
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Consumer<AuthProvider>(
                    builder: (_, authProviderRef, __) {
                  if (authProviderRef.status == Status.Authenticated) {
                    loadLessons(authProviderRef);
                    return Template();
                  }

                  if (authProviderRef.status ==
                              Status.Unauthenticated ||
                              authProviderRef.status == Status.Authenticating) {
                            return LoginScreen();
                          }

                  return SplashScreen();
                });
              }

              return SplashScreen();
                },
              ),
        ),
      ),
    );
  }

  void loadLessons(AuthProvider service) async {
    this.store.dispatch(ChangeIsLoadingLessons(isLoading: true));
    Map<String, String> studentInfo = Map();
    studentInfo.putIfAbsent('student', () => service.uid!);
    studentInfo.putIfAbsent('status',
        () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

    try {
      DateTime now = DateTime.now();
      List<Lesson>? lessons =
          await LessonDal.getScheduledLessonsFromDateByUser(service.uid!, now);
      this
          .store
          .dispatch(AddManyLessons(lessons: lessons!, earliestLesson: now));
    } catch (e) {
      this.store.dispatch(ChangeLessonError(error: e.toString()));
    } finally {
      this.store.dispatch(ChangeIsLoadingLessons(isLoading: false));
    }
  }
}
