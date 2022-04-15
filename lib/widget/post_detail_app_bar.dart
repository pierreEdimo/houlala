import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_button_container.dart';

class PostDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;


  PostDetailAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: CustomButtonContainer(
        icon: const FaIcon(FontAwesomeIcons.angleLeft),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.heart),
          onPressed: () {},
        ),
        CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.share),
          onPressed: () {},
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
