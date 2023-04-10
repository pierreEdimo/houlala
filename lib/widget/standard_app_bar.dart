import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'custom_button_container.dart';

class StandardAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final CustomButtonContainer? button;
  final String? title;

  StandardAppBar({
    this.title,
    this.button,
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
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/houlala1.png'),
                    ),
                    Text(
                      title!,
                      style: titleStyle,
                    ),
                  ],
                ),
                button != null ? button! : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//   actions: [],
//       automaticallyImplyLeading: false,
