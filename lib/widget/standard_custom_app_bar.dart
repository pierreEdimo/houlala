import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_button_container.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;

  CustomAppBar({
    this.title,
    Key? key,
  })  : preferredSize = const Size.fromHeight(70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        color: const Color(0xf2f2f2f2),
        child: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                    fontFamily: 'PoppinsBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
                CustomButtonContainer(
                  icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                  onPressed: () => Navigator.of(context).pushNamed("/search"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
