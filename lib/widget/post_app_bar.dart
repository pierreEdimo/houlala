import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_button_container.dart';

class AllPostAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;

  const AllPostAppBar({Key? key, this.title})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: CustomButtonContainer(
        icon: const FaIcon(
          FontAwesomeIcons.angleLeft,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title!,
      ),
      actions: [
        CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.plus),
          onPressed: () => print("hello World!"),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
