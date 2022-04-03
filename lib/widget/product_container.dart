import 'package:flutter/material.dart';
import 'package:houlala/model/product.dart';
import 'package:houlala/screens/product_detail_screen.dart';
import 'package:houlala/widget/background_image.dart';

class ProductContainer extends StatelessWidget {
  final Product? product;

  const ProductContainer({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        ProductDetailScreen.routeName,
        arguments: product!.id!,
      ),
      child: Card(
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
                  fontWeight: FontWeight.bold, fontFamily: 'PoppinsBold',
              ),
            ),
            Text(
              '${product!.initialPrice!.toString()} FCFA',
            ),
          ],
        ),
      ),
    );
  }
}
