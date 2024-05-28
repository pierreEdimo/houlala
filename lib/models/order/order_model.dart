import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houlala/models/user_model/user_model.dart';

import '../cart_item/cart_item.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  factory OrderModel({
    int? id,
    String? orderNumber,
    DateTime? deliveryDate,
    bool? confirmed,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserModel? user,
    bool? canceled,
    int? totalPrice,
    int? totalQuantityOfItems,
    List<CartItem>? items,
    SimpleLocation? location,

}) = _OrderModel;

factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}

@freezed
class SimpleLocation with _$SimpleLocation {
   factory SimpleLocation({
     String? name,
     int? id,
     String? imageUrl,
     String? email,
     String? uniqueIdentifier,
  }) = _SimpleLocation;

  factory SimpleLocation.fromJson(Map<String, dynamic> json) => _$SimpleLocationFromJson(json);
}