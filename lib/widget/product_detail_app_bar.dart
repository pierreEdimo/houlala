import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_button_container.dart';

class ProductDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  ProductDetailAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: CustomButtonContainer(
        icon: const FaIcon(
          FontAwesomeIcons.angleLeft,
          size: 24,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.heart),
          onPressed: () {},
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
