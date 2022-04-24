import 'package:flutter/material.dart';
import 'package:houlala/model/product.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/custom_elevated_button.dart';

class ProductContainer extends StatelessWidget {
  final Product? product;
  final String? displayType;

  const ProductContainer({
    Key? key,
    this.product,
    this.displayType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (displayType) {
      case 'favories':
        return Card(
          color: Colors.transparent,
          elevation: 0,
          child: Row(
            children: [
              Expanded(
                child: BackgroundImage(
                  imageUrl: product!.imageUrl!,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        product!.name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PoppinsBold',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Text(
                      '${product!.initialPrice!.toString()} FCFA',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomElevatedButton(
                      borderRadius: 2,
                      child: const Text("Ajouter au Panier"),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        );
      case 'cart-item':
        return Card(
          elevation: 0,
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 200,
                  child: BackgroundImage(
                    imageUrl: product!.imageUrl!,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  product!.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsBold',
                    fontSize: 22.0,
                  ),
                ),
              )
            ],
          ),
        );
      default:
        return Card(
          elevation: 0,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: BackgroundImage(
                  imageUrl: product!.imageUrl!,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                product!.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsBold',
                ),
              ),
              Text(
                '${product!.initialPrice!.toString()} FCFA',
              ),
            ],
          ),
        );
    }
  }
}
