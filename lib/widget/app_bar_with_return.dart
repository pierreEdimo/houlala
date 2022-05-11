import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
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
  })  : preferredSize = const Size.fromHeight(70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return elevation == 0 ? Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.transparent,
      child: SafeArea(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButtonContainer(
                icon: const FaIcon(FontAwesomeIcons.angleLeft),
                onPressed: () => Navigator.of(context).pop(),
              ),
              verticalSpacing,
              Text(
                title!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: "PoppinsBold"),
              )
            ],
          ),
        ),
      ),
    ) : Material(
      elevation: elevation!,
      child:  Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        color: color == null ? const Color(0xf2f2f2f2) : color!,
        child: SafeArea(
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButtonContainer(
                  icon: const FaIcon(FontAwesomeIcons.angleLeft),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                verticalSpacing,
                Flexible(
                  child: Text(
                    title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        fontFamily: "PoppinsBold"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
