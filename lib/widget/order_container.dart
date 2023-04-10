import 'package:flutter/material.dart';
import 'package:houlala/model/order.dart';
import 'package:houlala/widget/bordered_card.dart';
import 'package:houlala/widget/card_bottom.dart';
import 'package:houlala/widget/card_title.dart';
import 'package:houlala/widget/list_items.dart';

class OrderContainer extends StatelessWidget {
  final Order? order;
  final bool? confirmed;
  final String? status;

  const OrderContainer({
    Key? key,
    this.order,
    this.confirmed,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 'confirmation':
        return BorderedCard(
          child: Column(
            children: [
              CardTitle(
                name: order!.location!.name!,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListOfItems(
                status: status,
                confirmed: confirmed!,
                orderId: order!.id!,
                items: order!.cartItems!,
              ),
              CardBottom(
                quantity: order!.totalQuantity!,
                price: order!.totalPrice!,
              )
            ],
          ),
        );
      default:
        return BorderedCard(
          child: Column(
            children: [
              CardTitle(
                name: order!.location!.name!,
              ),
              const SizedBox(
                height: 10.0,
              ),
              confirmed!
                  ? Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2, color: Colors.grey.shade300))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text("Status: ",
                                  style: TextStyle(fontSize: 16.0)),
                              Text(
                                order!.status!,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: "PoppinsBold",
                                    color: getColor(order!.status!)),
                              ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     const Text(
                          //       "Date de Livraison: ",
                          //       style: TextStyle(fontSize: 16.0),
                          //     ),
                          //     CreatedAtContainer(
                          //       createdAt: order!.createdAt!,
                          //       fontSize: 16.0,
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10.0,
              ),
              ListOfItems(
                confirmed: confirmed!,
                orderId: order!.id!,
                items: order!.cartItems!,
              ),
              CardBottom(
                price: order!.totalPrice,
                quantity: order!.totalQuantity!,
              )
            ],
          ),
        );
    }
  }
}

Color getColor(String status) {
  Color color;
  switch (status) {
    case 'Delivre':
      color = const Color(0xff7CFC00);
      break;
    case 'Attente':
      color = const Color(0xffFF0000);
      break;
    default:
      color = const Color(0xff000000);
  }
  return color;
}
