import 'package:hive/hive.dart';
import 'package:houlala/model/cart-item.dart';
import 'package:houlala/model/product.dart';

class HiveBoxes {
  static Box<CartItem> getItems() => Hive.box<CartItem>('cart-items');

  static Box<Product> getProducts() => Hive.box<Product>('products');
}
