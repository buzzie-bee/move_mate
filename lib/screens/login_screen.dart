import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:move_mate/screens/home_screen.dart';
import 'package:move_mate/widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-screen';

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
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
              LoginButton(
                onPressed: () async {
                  try {
                    //TODO add loading spinner here
                    UserCredential user = await signInWithGoogle();
                    if (user != null) {
                      print(user);
                      Navigator.pushNamed(context, HomeScreen.id);
                    }
                  } catch (e) {
                    //TODO handle this error
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
