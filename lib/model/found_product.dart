import 'package:houlala/model/product.dart';

class FoundProduct {
  bool? isFavorite;
  final Product? product;

  FoundProduct({this.product, this.isFavorite});

  factory FoundProduct.fromJson(Map<String, dynamic> json) => FoundProduct(
        isFavorite: json['isFavorite'],
        product: Product.fromJson(
          json['product'],
        ),
      );
}
