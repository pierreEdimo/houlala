import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/order.dart';
import 'package:houlala/widget/bordered_card.dart';
import 'package:houlala/widget/cart_item_container.dart';
import 'package:houlala/widget/created_at_container.dart';

import '../model/cart_item.dart';

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
              ListOFItems(
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
                          Row(
                            children: [
                              const Text(
                                "Livraison: ",
                                style: TextStyle(fontSize: 16.0),
                              ),
                              CreatedAtContainer(
                                createdAt: order!.updatedAt!,
                                fontSize: 16.0,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10.0,
              ),
              ListOFItems(
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

class CardBottom extends StatelessWidget {
  final int? price;
  final int? quantity;

  const CardBottom({
    Key? key,
    this.price,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 15.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                "Quantite: ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "PoppinsBold",
                ),
              ),
              Text(
                quantity.toString(),
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                "Prix: ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "PoppinsBold",
                ),
              ),
              Text(
                '${price.toString()} FCFA',
                style: const TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  final String? name;

  const CardTitle({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FaIcon(
          FontAwesomeIcons.store,
          size: 22,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          name!,
          style: const TextStyle(
            fontSize: 22.0,
            fontFamily: "PoppinsBold",
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ListOFItems extends StatelessWidget {
  final List<CartItem>? items;
  final String? orderId;
  final bool? confirmed;
  final String? status;

  const ListOFItems({
    Key? key,
    this.items,
    this.orderId,
    this.confirmed,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: items!
          .map(
            (item) => CartItemContainer(
              status: status,
              cartItem: item,
              orderId: orderId!,
              confirmed: confirmed!,
            ),
          )
          .toList(),
    );
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
