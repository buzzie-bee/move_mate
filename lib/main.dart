import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:move_mate/screens/login_screen.dart';
import 'package:move_mate/screens/welcome_loading.dart';
import 'package:move_mate/screens/welcome_error.dart';
import 'package:move_mate/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // Set default `_initialized` and `_error` state to false
//   bool _initialized = false;
//   bool _error = false;
//
//   // Define an async function to initialize FlutterFire
//   void initializeFlutterFire() async {
//     try {
//       // Wait for Firebase to initialize and set `_initialized` state to true
//       await Firebase.initializeApp();
//       setState(() {
//         _initialized = true;
//         Navigator.pushNamed(context, LoginScreen.id);
//       });
//     } catch (e) {
//       // Set `_error` state to true if Firebase initialization fails
//       setState(() {
//         _error = true;
//         Navigator.pushNamed(context, WelcomeError.id);
//       });
//     }
//   }
//
//   String initialRoute() {
//     return _initialized ? LoginScreen.id : WelcomeLoading.id;
//   }
//
//   @override
//   void initState() {
//     initializeFlutterFire();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Show error message if initialization failed
//     return MaterialApp(
//       //initialRoute: initialRoute(),
//       routes: {
//         WelcomeLoading.id: (context) => WelcomeLoading(),
//         WelcomeError.id: (context) => WelcomeError(),
//         LoginScreen.id: (context) => LoginScreen(),
//       },
//       builder: ,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: initialRoute(),
      routes: {
        WelcomeLoading.id: (context) => WelcomeLoading(),
        WelcomeError.id: (context) => WelcomeError(),
        LoginScreen.id: (context) => LoginScreen(),
      },
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
                return (!snapshot.hasData) ? LoginScreen() : HomeScreen();
              },
            );
          }
          return WelcomeLoading();
        },
      ),
    );
  }
}
