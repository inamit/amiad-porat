import 'package:amiadporat/models/user.dart';
import 'package:amiadporat/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({
    required Key key,
    required this.builder,
    // required this.databaseBuilder
  }) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<MyUser?>) builder;
  // final FirestoreDatabase Function(BuildContext context, String uid)
  //     databaseBuilder;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context, listen: true);

    return FutureBuilder(
        future: authService.user,
        builder: (BuildContext context, AsyncSnapshot<MyUser?> snapshot) {
          final MyUser? user = snapshot.data;
          if (user != null) {
            return MultiProvider(
              providers: [
                Provider<MyUser?>.value(value: user),
                // Provider<FirestoreDatabase>(
                //   create: (context) => databaseBuilder(context, user.uid),
                // ),
              ],
              child: builder(context, snapshot),
            );
          }

          return builder(context, snapshot);
        });
    // return authService.user != null
    //     ? MultiProvider(
    //         providers: [
    //           Provider<MyUser>.value(value: authService.user!),
    //           // Provider<FirestoreDatabase>(
    //           //   create: (context) => databaseBuilder(context, user.uid),
    //           // ),
    //         ],
    //         child: builder(context),
    //       )
    //     : builder(context);
    // return StreamBuilder<MyUser?>(
    //   stream: authService.user,
    //   builder: (BuildContext context, AsyncSnapshot<MyUser?> snapshot) {
    //     final MyUser? user = snapshot.data;
    //     print("User: $user");
    //     if (user != null) {
    //       /*
    //       * For any other Provider services that rely on user data can be
    //       * added to the following MultiProvider list.
    //       * Once a user has been detected, a re-build will be initiated.
    //        */

    //     }
    //     return builder(context, snapshot);
    //   },
    // );
  }
}
