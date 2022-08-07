import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/grid_pages.dart';

class ShopContainerBox extends StatelessWidget {
  final String? shopUrl;
  final String? title;
  const ShopContainerBox({Key? key, this.shopUrl, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: GridPages(
        child: Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            title!,
            style: standardStyle,
          ),
        ),
        direction: Axis.horizontal,
        uri: shopUrl!,
      ),
    );
  }
}
