import 'package:e_shoew/constants.dart';
import 'package:e_shoew/screens/home_page.dart';
import 'package:e_shoew/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, stream_snapshot) {
              if (stream_snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Error: ${stream_snapshot.error}',
                      style: Constants.regularHeading,
                    ),
                  ),
                );
              } else if (stream_snapshot.connectionState ==
                  ConnectionState.active) {
                Object? _user = stream_snapshot.data;
                if (_user == null) {
                  return LoginPage();
                } else {
                  return HomePage();
                }
              } else {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Loading...',
                      style: Constants.regularHeading,
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
