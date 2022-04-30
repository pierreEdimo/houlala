
class CountAndPrice {
  final int? totalPrice;
  final int? totalQuantity;

  CountAndPrice({
    this.totalPrice,
    this.totalQuantity
  });

  // factory CountAndPrice.fromJson(Map<String, dynamic> json) =>
  //     CountAndPrice(
  //       totalPrice: json['totalPrice'] as int,
  //       totalQuantity: json['totalQuantity'] as int,
  //     );
}