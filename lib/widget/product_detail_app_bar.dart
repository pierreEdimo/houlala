import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/product.dart';
import 'package:houlala/widget/book_marker.dart';
import 'custom_button_container.dart';

class ProductDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  final Product? product;
  @override
  final Size preferredSize;

  ProductDetailAppBar({Key? key, this.product})
      : preferredSize = const Size.fromHeight(70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: horizontalPadding,
      child: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonContainer(
                icon: const FaIcon(
                  FontAwesomeIcons.angleLeft,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              BookMarker(
                foundProduct: product,
              )
            ],
          ),
        ),
      ),
    );
  }
}

