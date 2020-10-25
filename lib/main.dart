import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            title: 'Error',
            home: Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text('Error'),
              ),
            ),
          );
          ;
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Loaded - this is the app',
            home: Scaffold(
              appBar: AppBar(
                title: Text('Loaded - this is the app'),
              ),
              body: Center(
                child: Text('Loaded - this is the app'),
              ),
            ),
          );
          ;
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          title: 'Loading',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Loading'),
            ),
            body: Center(
              child: Text('Loading'),
            ),
          ),
        );
        ;
      },
    );
  }
}
