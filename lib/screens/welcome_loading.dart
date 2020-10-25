import 'package:flutter/material.dart';

class WelcomeLoading extends StatelessWidget {
  static const String id = 'welcome-loading';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('assets/movemate_logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
