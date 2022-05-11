import 'package:hive/hive.dart';
import 'package:houlala/model/address.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/model/personal_datas.dart';

class HiveBoxes {
  static Box<CartItem> getItems() => Hive.box<CartItem>('cart-items');

  static Box<PersonalData> getUser() => Hive.box<PersonalData>('user');

  static Box<Address> getAddress() => Hive.box<Address>('address');
}
