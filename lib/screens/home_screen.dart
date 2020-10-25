import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:move_mate/widgets/logout_button.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Welcome to the home page',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'LoggedInUser : ${_auth.currentUser.uid}',
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
