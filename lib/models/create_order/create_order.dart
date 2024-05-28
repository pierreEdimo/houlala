import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houlala/models/user_model/user_model.dart';
import '../cart_item/cart_item.dart';

part 'create_order.freezed.dart';
part 'create_order.g.dart';

@freezed
class CreateOrder with _$CreateOrder{
   factory CreateOrder({
    String? locationUniqueId,
    int? paymentMethodId,
    UserModel? user,
    List<CartItem>? items
}) = _CreateOrder;

  factory CreateOrder.fromJson(Map<String, dynamic> json) =>
_$CreateOrderFromJson(json);

}