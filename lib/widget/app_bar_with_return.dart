import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/widget/custom_button_container.dart';

class AppBarWithReturn extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? title;
  final Color? color;
  final double? elevation;

  AppBarWithReturn({
    this.title,
    this.elevation,
    this.color,
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color,
      leading: CustomButtonContainer(
        icon: const FaIcon(
          FontAwesomeIcons.angleLeft,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: elevation!,
      title: Text(
        title!,
      ),
    );
  }
}
