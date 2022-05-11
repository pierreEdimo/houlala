import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/found_product.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/widget/custom_button_container.dart';
import 'package:houlala/widget/open_login_modal.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:provider/provider.dart';

class BookMarker extends StatefulWidget {
  final FoundProduct? foundProduct;

  const BookMarker({
    Key? key,
    this.foundProduct,
  }) : super(key: key);

  @override
  State<BookMarker> createState() => _BookMarkerState();
}

class _BookMarkerState extends State<BookMarker> {
  @override
  Widget build(BuildContext context) {
    return CustomButtonContainer(
      icon: widget.foundProduct!.isFavorite!
          ? const FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
            )
          : const FaIcon(FontAwesomeIcons.heart),
      onPressed: () async {
        String? userId = "";

        if(!kIsWeb){
          userId = await storage.read(key: "userId");
        } else {
          userId = userIdBox.get("userId");
        }

        if (userId != null) {
          var oldStatus = widget.foundProduct!.isFavorite!;
          setState(() {
            widget.foundProduct!.isFavorite =
                !(widget.foundProduct!.isFavorite!);
          });
          try {
            await Provider.of<ProductService>(context, listen: false)
                .bookMarkProduct(widget.foundProduct!.product!.id!);

            if (widget.foundProduct!.isFavorite!) {
              showSnack(const Text("Article a ete enregiste dans vos favoris"),
                  context);
            } else {
              showSnack(
                  const Text("Article a ete supprime de vos favoris"), context);
            }
          } catch (error) {
            setState(() {
              widget.foundProduct!.isFavorite = oldStatus;
            });
          }
        } else {
          openModal(context);
        }
      },
    );
  }
}
