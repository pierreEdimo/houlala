import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
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
        padding: horizontalPadding,
        child: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 35,
                      backgroundImage: AssetImage('images/houlala1.png'),
                    ),
                    Text(
                      title!,
                      style: titleStyle,
                    )
                  ],
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
