import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_button_container.dart';
import 'dart:io' show Platform;

class CustomAppBar extends StatelessWidget with ObstructingPreferredSizeWidget{
  @override
  final Size preferredSize;

  final String? title;

  CustomAppBar({
    this.title,
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return  CupertinoNavigationBar(
        leading: Text(title!),
        trailing: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          onPressed: () => Navigator.of(context).pushNamed("/search"),
        ),
      );
    }
    return AppBar(
      elevation: 1,
      centerTitle: false,
      title: Text(
        title!,
      ),
      actions: [
        CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          onPressed: () => Navigator.of(context).pushNamed("/search"),
        ),
        // CustomButtonContainer(
        //   icon: const FaIcon(FontAwesomeIcons.newspaper),
        //   onPressed: () => print("news"),
        // ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    // TODO: implement shouldFullyObstruct
    throw UnimplementedError();
  }
}
