import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem{
   factory CartItem({
    String? productSku,
    int? price,
    int? initialPrice,
    String? imageUrl,
    int? quantity,
    String?product,
}) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}