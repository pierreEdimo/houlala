import 'package:hive/hive.dart';
import 'package:houlala/model/address.dart';

class HiveBoxes {

  static Box<Address> getAddress() => Hive.box<Address>('address');
}
