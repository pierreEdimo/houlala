import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:houlala/screens/cart_item_screen.dart';
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
      bottomItems: [
        BottomItem(
          icon: HeroIcon(HeroIcons.homeModern),
          selectedIcon: HeroIcon(HeroIcons.homeModern, style: HeroIconStyle.solid),
          size: 25,
        ),
        BottomItem(
          icon: HeroIcon(HeroIcons.shoppingCart),
          selectedIcon: HeroIcon(HeroIcons.shoppingCart, style: HeroIconStyle.solid),
          size: 25,
        ),
        BottomItem(
          icon: HeroIcon(HeroIcons.bell),
          selectedIcon: HeroIcon(HeroIcons.bell, style: HeroIconStyle.solid),
          size: 25,
        ),
        BottomItem(
          icon: HeroIcon(HeroIcons.user),
          selectedIcon: HeroIcon(HeroIcons.user, style: HeroIconStyle.solid),
          size: 25,
        )
      ],
      selectedColor: Colors.orange,
      unSelectedColor: Colors.black,
      children:  [
        HomeScreen(),
        CartItemScreen(),
        NotificationScreen(),
        UserScreen()
      ],
    );
  }
}
