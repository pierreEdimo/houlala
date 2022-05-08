import 'package:flutter/material.dart';
import 'package:houlala/model/order.dart';
import 'package:houlala/widget/created_at_container.dart';
import 'package:houlala/widget/horizontal_cart_preview.dart';

import 'package:houlala/widget/standard_custom_container.dart';



import '../model/add_cart_item.dart';
import 'display_dialog.dart';

class OrderContainer extends StatelessWidget {
  final Order? order;

  const OrderContainer({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardCustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CreatedAtContainer(
            createdAt: order!.createdAt!,
          ),
          const SizedBox(
            height: 3.0,
          ),
          HorizontalCartPreview(
            items: order!.cartItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "prix total:",
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${order!.totalPrice.toString()} FCFA',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // CustomElevatedButton(
              //   onPressed: () async {
              //     var userId = await storage.read(key: "userId");
              //
              //     Address? address =
              //         Provider.of<AuthService>(context, listen: false)
              //             .getAddress();
              //
              //     late AddCartItem newItem;
              //     late List<AddCartItem> newItems = [];
              //
              //     for (var item in order!.cartItems) {
              //       newItem = AddCartItem(
              //           userId: userId,
              //           pageId: item.product!.page!.id,
              //           productName: item.product!.name!,
              //           productId: item.product!.id,
              //           totalPrice: item.totalPrice,
              //           quantity: item.quantity);
              //
              //       newItems.add(newItem);
              //     }
              //
              //     AddOrder newOrder = AddOrder(
              //         totalQuantity: order!.totalQuantity!,
              //         totalPrice: order!.totalPrice!,
              //         cartItems: newItems,
              //         user: order!.user!,
              //         payMentMode: "Cash",
              //         orderOptions: "Livraison",
              //         status: "Attente",
              //         address: address);
              //
              //     Response response =
              //         await Provider.of<OrderService>(context, listen: false)
              //             .addOrder(newOrder);
              //
              //     if (response.statusCode == 201) {
              //       showSnack(
              //           const Text(
              //               "Votre Commande a ete envoyee, vous serz contacte pour plus d'informations"),
              //           context,
              //           second: 2);
              //     } else {
              //       showErrorDialog(context, "Erreur",
              //           "Desole, nous ne pouvons pas proceder votre commande , veuillez reasseyer, si le probleme persiste, contactez notre service client.");
              //     }
              //   },
              //   child: Text(
              //     '(${order!.totalQuantity.toString()}) Commander encore',
              //     style: const TextStyle(fontWeight: FontWeight.bold),
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
