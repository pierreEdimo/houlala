import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:houlala/controllers/order_controller.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/models/cart_item/cart_item.dart';
import 'package:houlala/models/order/order_model.dart';
import 'package:houlala/shared_widgets/decrease_quantity_text.dart';
import 'package:houlala/shared_widgets/increase_quantity_text.dart';

class CartItemContainer extends StatelessWidget {
  final OrderModel? orderModel;
  final OrderController? orderController;
  final ProductController? productController;

  const CartItemContainer({
    super.key,
    this.orderModel,
    this.orderController,
    this.productController,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(orderModel!.location!.imageUrl!),
                ),
                const SizedBox(width: 10.0),
                Text(
                  orderModel!.location!.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22.0),
                )
              ],
            ),
            standardSizedBox,
            ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: orderModel!.items!
                  .map(
                    (item) => ItemProduct(
                      item: item,
                      orderController: orderController,
                      productController: productController,
                      orderNumber: orderModel!.orderNumber!,
                    ),
                  )
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
            )
          ],
        ),
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  final CartItem? item;
  final String? orderNumber;
  final OrderController? orderController;
  final ProductController? productController;

  const ItemProduct({
    super.key,
    this.item,
    this.orderNumber,
    this.orderController,
    this.productController,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => productController!.selectProduct(item!.productSku!, context),
      child: Card(
        color: Colors.white,
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
                            InkWell(
                              onTap: () => item!.quantity! > 1
                                  ? orderController!.decreaseItemQuantity(
                                      orderNumber!, item!.productSku!)
                                  : orderController!.deleteProductFromCart(
                                      orderNumber!, item!.productSku!),
                              child: item!.quantity! > 1
                                  ? const DecreaseQuantityText()
                                  : const HeroIcon(
                                      HeroIcons.trash,
                                      size: 20,
                                    ),
                            ),
                            const SizedBox(width: 20.0),
                            Text(
                              "${item!.quantity!}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20.0),
                            InkWell(
                              onTap: () => orderController!
                                  .increaseItemQuantity(
                                      orderNumber!, item!.productSku!),
                              child: const InCreaseQuantityText(),
                            )
                          ],
                        ),
                        const SizedBox(width: 20.0),
                        IconButton(
                          onPressed: () => orderController!
                              .deleteProductFromCart(
                                  orderNumber!, item!.productSku!),
                          icon: const HeroIcon(
                            HeroIcons.trash,
                            size: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
