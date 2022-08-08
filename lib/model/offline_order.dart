import 'package:hive/hive.dart';

import 'cart_item.dart';

part 'offline_order.g.dart';

@HiveType(typeId: 1)
class OfflineOrder extends HiveObject {
  @HiveField(0)
  final String? locationId;

  @HiveField(1)
  final String? locationName;

  @HiveField(2)
  late int? totalQuantity;

  @HiveField(3)
  late int? totalPrice;

  @HiveField(4)
  final List<CartItem>? cartItems;

  OfflineOrder({
    this.locationId,
    this.locationName,
    this.totalPrice,
    this.totalQuantity,
    this.cartItems,
  });
}
