import 'package:hive/hive.dart';
import 'package:houlala/model/cart-item.dart';

class HiveBoxes{
  static Box<CartItem> getItems() => Hive.box<CartItem>('cart-items');
}