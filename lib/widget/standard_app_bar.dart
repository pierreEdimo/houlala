import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        color: const Color(0xf2f2f2f2),
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
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PoppinsBold',
                          fontSize: 20),
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
