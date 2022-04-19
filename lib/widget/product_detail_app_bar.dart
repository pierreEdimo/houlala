import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/widget/book_Marker.dart';
import 'package:houlala/model/found_product.dart';
import 'custom_button_container.dart';

class ProductDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  final FoundProduct? product;
  @override
  final Size preferredSize;

  ProductDetailAppBar({Key? key, this.product})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: CustomButtonContainer(
        icon: const FaIcon(
          FontAwesomeIcons.angleLeft,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        BookMarker(
          foundProduct: product,
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
