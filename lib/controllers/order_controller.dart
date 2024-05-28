import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/models/create_order/create_order.dart';
import 'package:houlala/models/order/order_model.dart';
import 'package:houlala/providers/order_provider.dart';

class OrderController {
  WidgetRef ref;

  OrderController(this.ref);

  void addProductToCart(CreateOrder order, {SimpleLocation? location}) {
    ref
        .read(orderStateNotifierProvider.notifier)
        .addProductToCarts(order, location: location);
  }

  void deleteProductFromCart(String orderNumber, String productSku) {
    ref
        .read(orderStateNotifierProvider.notifier)
        .deleteProductFromCart(orderNumber, productSku);
  }

  void decreaseItemQuantity(String orderNumber, String productSku) {
    ref
        .read(orderStateNotifierProvider.notifier)
        .decreaseItemQuantity(orderNumber, productSku);
  }

  void confirmOrders(String userId, String sellerEmail) {
    try {
      ref
          .read(orderStateNotifierProvider.notifier)
          .confirmOrders(userId, sellerEmail);
    } catch (e) {
      rethrow;
    }
  }

  void increaseItemQuantity(String orderNumber, String productSku) {
    ref
        .read(orderStateNotifierProvider.notifier)
        .increaseItemQuantity(orderNumber, productSku);
  }

  List<OrderModel> get usersOrders {
    return ref.watch(orderStateNotifierProvider).orderList;
  }

  List<OrderModel> get unConfirmedOrders {
    return usersOrders.where((element) => element.confirmed == false).toList();
  }

  bool get loading {
    return ref.watch(orderStateNotifierProvider).loading;
  }

  bool get error {
    return ref.watch(orderStateNotifierProvider).error;
  }

  String get errorMessage {
    return ref.watch(orderStateNotifierProvider).errorMessage;
  }
}
