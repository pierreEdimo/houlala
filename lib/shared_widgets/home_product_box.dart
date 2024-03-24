import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/helper/category_name.dart';
import 'package:houlala/models/page_screen_args/page_screen_arguments.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/screens/category_detail_screen.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/shared_widgets/product_container.dart';
import 'package:houlala/shared_widgets/custom_box_container.dart';

class HomeProductByCategoryBox extends ConsumerWidget {
  final String? categoryName;
  final String? titleBox;

  const HomeProductByCategoryBox({
    super.key,
    this.categoryName,
    this.titleBox,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductController productController = ProductController(ref);
    List<ProductModel> productList = productController
        .getProductListsByCategoryName(categoryName!)
        .take(4)
        .toList();

    return CustomBodyContainer(
      loading: productController.isLoading,
      error: productController.hasError,
      errorMessage: productController.errorMessage,
      loadingHeight: MediaQuery.of(context).size.height * 0.50,
      child: CustomBoxContainer(
        title: titleBox,
        urlValue: CategoryDetailScreen.routeName,
        arguments: const PageScreenArguments(
            categoryName: CategoryName.fruitsAndLettuces, categoryId: 1),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          childAspectRatio: 1 / 1.2,
          children: productList
              .map(
                (product) => ProductContainer(
                  productModel: product,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
