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
                    Container(
                      width: 70,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/houlala1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Text(
                      title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PoppinsBold',
                          fontSize: 20
                      ),
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
