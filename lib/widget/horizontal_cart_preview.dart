import 'package:flutter/material.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:sizer/sizer.dart';

import 'cart_item_container.dart';

class HorizontalCartPreview extends StatelessWidget {
  final List<CartItem>? items;

  const HorizontalCartPreview({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 25.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items!
            .map((CartItem item) => CartItemContainer(
          horizontal: "horizontal",
          cartItem: item,
        ))
            .toList(),
      ),
    );
  }
}
