import 'package:flutter/material.dart';

import 'package:move_mate/screens/profile.dart';
import 'package:move_mate/screens/settings.dart';
import 'package:move_mate/screens/my_moves.dart';

final Map<String, String> titles = <String, String>{
  'default': 'Move Mate',
  MyMoves.id: 'My Moves',
  Profile.id: 'Profile',
  Settings.id: 'Settings',
};

class NavigationDrawer extends StatelessWidget {
  final String currentScreen;
  final bool isHome;

  NavigationDrawer({this.currentScreen = 'default', this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              '${titles[currentScreen]}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          DrawerListTile(
            isHome: isHome,
            route: MyMoves.id,
            icon: Icon(Icons.house),
          ),
          DrawerListTile(
            isHome: isHome,
            route: Profile.id,
            icon: Icon(Icons.person_outline),
          ),
          DrawerListTile(
            isHome: isHome,
            route: Settings.id,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final bool isHome;
  final String route;
  final Icon icon;

  DrawerListTile(
      {this.isHome = false, @required this.icon, @required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(titles[route]),
      onTap: () {
        Navigator.pop(context);
        if (isHome) {
          Navigator.pushNamed(context, route);
        } else {
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }
}
