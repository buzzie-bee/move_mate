import 'package:flutter/material.dart';
import 'package:move_mate/widgets/navigation_drawer.dart';

class Settings extends StatelessWidget {
  static const String id = 'settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MoveMate'),
      ),
      drawer: NavigationDrawer(
        currentScreen: id,
      ),
      body: Container(
        child: Text('Settings screen'),
      ),
    );
  }
}
