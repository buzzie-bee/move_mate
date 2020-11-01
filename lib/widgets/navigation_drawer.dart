import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:move_mate/screens/home_screen.dart';

import 'package:move_mate/screens/profile.dart';
import 'package:move_mate/screens/settings.dart';
import 'package:move_mate/screens/my_moves.dart';

final Map<String, String> titles = <String, String>{
  'default': 'Move Mate',
  HomeScreen.id: 'Home',
  MyMoves.id: 'My Moves',
  Profile.id: 'Profile',
  Settings.id: 'Settings',
};

class NavigationDrawer extends StatelessWidget {
  final String currentScreen;
  final bool isHome;
  final Function onSelect;

  NavigationDrawer(
      {this.currentScreen = 'default', this.isHome = false, this.onSelect});

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
            route: HomeScreen.id,
            icon: Icon(Icons.home),
            onSelect: onSelect,
          ),
          DrawerListTile(
            route: MyMoves.id,
            icon: Icon(FontAwesomeIcons.box),
            onSelect: onSelect,
          ),
          DrawerListTile(
            route: Profile.id,
            icon: Icon(Icons.person_outline),
            onSelect: onSelect,
          ),
          DrawerListTile(
            route: Settings.id,
            icon: Icon(Icons.settings),
            onSelect: onSelect,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String route;
  final Icon icon;
  final Function onSelect;

  DrawerListTile(
      {@required this.icon, @required this.route, @required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(titles[route]),
      onTap: () {
        Navigator.pop(context);
        onSelect(route);
      },
    );
  }
}
