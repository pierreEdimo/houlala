import 'package:flutter/material.dart';
import 'package:houlala/screens/cart_item_screen.dart';
import 'package:houlala/screens/discover_screen.dart';
import 'package:houlala/screens/home_screen.dart';
import 'package:houlala/screens/notification_screen.dart';
import 'package:houlala/screens/user_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            return const HomeScreen();
          case DeviceScreenType.tablet:
          case DeviceScreenType.mobile:
          default:
            return const BottomNavigation();
        }
      },
    );
  }
}

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
    CartItemScreen(),
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
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/house.png"),
              size: 25,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/category.png"),
              size: 25,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: const [
                ImageIcon(
                  AssetImage("images/cart.png"),
                  size: 25,
                ),
              ],
            ),
            label: "Stories",
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/notification.png"),
              size: 25,
            ),
            label: 'Notifications',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/user.png"),
              size: 25,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: const Color(0xff000000),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
      ),
    );
  }
}
