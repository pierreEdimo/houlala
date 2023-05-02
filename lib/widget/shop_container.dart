import 'package:flutter/material.dart';
import 'package:houlala/widget/custom_box_container.dart';

class ShopContainer extends StatelessWidget {
  final Widget? child;

  const ShopContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomBoxContainer(
        child: child!,
      ),
    );
  }
}
