import 'package:flutter/material.dart';

class WelcomeError extends StatelessWidget {
  static const String id = 'welcome-error';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text('Error'),
      ),
    );
  }
}
