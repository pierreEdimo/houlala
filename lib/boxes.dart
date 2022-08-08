import 'package:hive/hive.dart';
import 'package:houlala/model/address.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/model/offline_order.dart';

class HiveBoxes {

  static Box<Address> getAddress() => Hive.box<Address>('address');

  static Box<OfflineOrder> getOrders() => Hive.box<OfflineOrder>('orders');

  static Box<CartItem> getCartItems() => Hive.box<CartItem>('items');
}
