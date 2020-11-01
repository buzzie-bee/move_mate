import 'package:flutter/material.dart';
import 'package:move_mate/screens/home_screen.dart';
import 'package:move_mate/screens/profile.dart';
import 'package:move_mate/screens/settings.dart';
import 'package:move_mate/widgets/navigation_drawer.dart';

import 'my_moves.dart';

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  String route = HomeScreen.id;

  Widget _buildPage() {
    switch (route) {
      case HomeScreen.id:
        return HomeScreen();
      case MyMoves.id:
        return MyMoves();
      case Profile.id:
        return Profile();
      case Settings.id:
        return Settings();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MoveMate'),
      ),
      drawer: NavigationDrawer(
        currentScreen: route,
        onSelect: (route) {
          setState(() {
            this.route = route;
          });
        },
      ),
      body: _buildPage(),
    );
  }
}
