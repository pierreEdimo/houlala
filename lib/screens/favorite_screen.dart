import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/shared_widgets/favorite_product_container.dart';
import 'package:houlala/widget/custom_button_container.dart';

class FavoriteScreen extends ConsumerWidget {
  static const routeName = '/favorites';

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductController productController = ProductController(ref);
    List<ProductModel> productList = productController.bookMarkedProductList;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Mes Favories'),
      ),
      body: CustomBodyContainer(
        loading: productController.isLoading,
        loadingHeight: MediaQuery.of(context).size.height * 1,
        error: productController.hasError,
        errorMessage: productController.errorMessage,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('${productList.length} produit(s) dans les favories'),
                const SizedBox(height: 10.0),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 1/1.4,
                  physics: const ClampingScrollPhysics(),
                  children: productList
                      .map(
                        (product) => FavoriteProductContainer(
                          productModel: product,
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
