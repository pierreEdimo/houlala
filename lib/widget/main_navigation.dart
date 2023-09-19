import 'package:flutter/material.dart';
import 'package:houlala/screens/cart_item_screen.dart';
import 'package:houlala/screens/discover_screen.dart';
import 'package:houlala/screens/home_screen.dart';
import 'package:houlala/screens/notification_screen.dart';
import 'package:houlala/screens/user_screen.dart';
import 'package:houlala/widget/bottom_item.dart';
import 'package:houlala/widget/layout.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Layout(
      children: [
        HomeScreen(),
        DiscoverScreen(),
        CartItemScreen(),
        NotificationScreen(),
        UserScreen()
      ],
      bottomItems: [
        BottomItem(
          icon: ImageIcon(AssetImage("images/house.png")),
          selectedIcon: ImageIcon(AssetImage("images/house_fill.png")),
          size: 25,
        ),
        BottomItem(
          icon: ImageIcon(AssetImage("images/category.png")),
          selectedIcon: ImageIcon(AssetImage("images/categorie_fill.png")),
          size: 25,
        ),
        BottomItem(
          icon: ImageIcon(AssetImage("images/cart.png")),
          selectedIcon: ImageIcon(AssetImage("images/cart_fill.png")),
          size: 25,
        ),
        BottomItem(
          icon: ImageIcon(AssetImage("images/notification.png")),
          selectedIcon: ImageIcon(AssetImage("images/bell_fill.png")),
          size: 25,
        ),
        BottomItem(
          icon: ImageIcon(AssetImage("images/user.png")),
          selectedIcon: ImageIcon(AssetImage("images/user_fill.png")),
          size: 25,
        )
      ],
      selectedColor: Colors.orange,
      unSelectedColor: Colors.black,
    );
  }
}
