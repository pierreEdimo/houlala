import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/models/product/product_model.dart';

class ProductContainer extends ConsumerWidget {
  final ProductModel? productModel;

  const ProductContainer({
    super.key,
    this.productModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductController productController = ProductController(ref);
    return InkWell(
      onTap: () =>
          productController.selectProduct(productModel!.productSku!, context),
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: NetworkImage(productModel!.imageUrl!),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Text(
              productModel!.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)
              ),
            ),
            Text(
              '${productModel!.sellingPrice!.toString()} XAF',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
