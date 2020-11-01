import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:move_mate/screens/AppContainer.dart';

import 'package:move_mate/screens/login_screen.dart';
import 'package:move_mate/screens/my_moves.dart';
import 'package:move_mate/screens/settings.dart';
import 'package:move_mate/screens/welcome_loading.dart';
import 'package:move_mate/screens/welcome_error.dart';
import 'package:move_mate/screens/home_screen.dart';
import 'package:move_mate/screens/profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        WelcomeLoading.id: (context) => WelcomeLoading(),
        WelcomeError.id: (context) => WelcomeError(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        Profile.id: (context) => Profile(),
        Settings.id: (context) => Settings(),
        MyMoves.id: (context) => MyMoves(),
      },
      theme: ThemeData.light(),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return WelcomeError();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder<User>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, snapshot) {
                return (!snapshot.hasData) ? LoginScreen() : AppContainer();
              },
            );
          }
          return WelcomeLoading();
        },
      ),
    );
  }
}
