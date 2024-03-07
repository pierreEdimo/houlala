import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/shared_widgets/product_container.dart';

import '../widget/custom_elevated_button.dart';

class FavoriteProductContainer extends StatelessWidget {
  final ProductModel? productModel;

  const FavoriteProductContainer({
    super.key,
    this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ProductContainer(
            productModel: productModel,
          ),
        ),
        CustomElevatedButton(
          child: const Text("Ajouter au Panier"),
          onPressed: () {}
        )
      ],
    );
  }
}
