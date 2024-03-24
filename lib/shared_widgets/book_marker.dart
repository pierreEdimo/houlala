import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/product.dart';
import 'package:houlala/service/product_service.dart';
import 'package:provider/provider.dart';

import 'custom_elevated_button.dart';
import 'show_nack.dart';

class BookMarker extends StatefulWidget {
  final Product? foundProduct;

  const BookMarker({
    Key? key,
    this.foundProduct,
  }) : super(key: key);

  @override
  State<BookMarker> createState() => _BookMarkerState();
}

class _BookMarkerState extends State<BookMarker> {
  /// enregistre les Produits dans les Favoris
  bookmarkProduct() async {
    String? userId = "";

    userId = await storage.read(key: "userId");

    if (userId != null) {
      var oldStatus = widget.foundProduct!.bookMarked!;
      setState(() {
        widget.foundProduct!.bookMarked = !(widget.foundProduct!.bookMarked!);
      });
      try {
        await Provider.of<ProductService>(context, listen: false)
            .bookMarkProduct(widget.foundProduct!.id!);

        if (widget.foundProduct!.bookMarked!) {
          showSnack(
              const Text("Article a ete enregiste dans vos favoris"), context);
        } else {
          showSnack(
              const Text("Article a ete supprime de vos favoris"), context);
        }
      } catch (error) {
        setState(() {
          widget.foundProduct!.bookMarked = oldStatus;
        });
      }
    } else {
      Navigator.of(context).pushNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.foundProduct!.bookMarked!
              ? const FaIcon(
            FontAwesomeIcons.solidHeart,
            color: Colors.red,
            size: 20.0,
          )
              : const FaIcon(
            FontAwesomeIcons.heart,
            size: 20.0,
          ),
          horizontalSpacing,
          const Text("Ajouter aux favoris")
        ],
      ),
      onPressed: () async => bookmarkProduct(),
    );
  }
}
