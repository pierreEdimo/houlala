import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      title: Text(
        title!,
      ),
      actions: [
        button != null
            ? button!
            : Container()
      ],
      automaticallyImplyLeading: false,
    );
  }
}
