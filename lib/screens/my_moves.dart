import 'package:flutter/material.dart';
import 'package:move_mate/widgets/navigation_drawer.dart';

class MyMoves extends StatelessWidget {
  static const String id = 'my_moves';
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
        child: Text('My Moves Screen'),
      ),
    );
  }
}
