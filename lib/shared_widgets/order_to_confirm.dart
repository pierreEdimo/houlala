import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/models/cart_item/cart_item.dart';
import 'package:houlala/models/order/order_model.dart';
import 'package:houlala/shared_widgets/material_container.dart';

class OrderToConfirmContainer extends StatelessWidget {
  final OrderModel? orderModel;

  const OrderToConfirmContainer({super.key, this.orderModel});

  @override
  Widget build(BuildContext context) {
    return MaterialContainer(
      color: Colors.grey.shade100,
      child: Column(
        children: [
          Row(
            children: [
              const Text("Vendeur:"),
              const SizedBox(width: 10),
              Text(
                orderModel!.location!.name!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          standardSizedBox,
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: orderModel!.items!
                .map((e) => ItemProduct(
                      item: e,
                    ))
                .toList(),
          ),
          standardSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Text('Total:'),
                  const SizedBox(width: 5.0),
                  Text(
                    '${orderModel!.totalPrice} XAF',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(width: 20.0),
              Row(
                children: [
                  const Text('Quantite:'),
                  const SizedBox(width: 5.0),
                  Text(
                    '${orderModel!.totalQuantityOfItems}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  final CartItem? item;

  const ItemProduct({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: 190,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item!.imageUrl!),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item!.product!,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '${item!.price!} XAF',
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "${item!.quantity!}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 20.0),
                        ],
                      ),
                      const SizedBox(width: 20.0),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
