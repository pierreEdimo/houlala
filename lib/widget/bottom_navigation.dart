import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/screens/discover_screen.dart';
import 'package:houlala/screens/home_screen.dart';
import 'package:houlala/screens/notification_screen.dart';
import 'package:houlala/screens/user_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DiscoverScreen(),
    NotificationScreen(),
    UserScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidCompass),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidBell),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
      ),
    );
  }
}
