import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/custom_button_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';

class ModalBar extends StatelessWidget {
  final double? height;
  final String? title;

  const ModalBar({
    Key? key,
    this.height,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        color: lightgrey,
        child: StandardCustomContainer(
          child: SizedBox(
            height: height == null ? 90.0 : height!,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 35.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle,
                      ),
                    ),
                    CustomButtonContainer(
                      icon: const FaIcon(FontAwesomeIcons.xmark),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
