import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/controllers/sub_category_controller.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/models/sub_category/sub_category_model.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/shared_widgets/product_column.dart';
import 'package:houlala/widget/custom_button_container.dart';

import '../models/sub_category_parameter/sub_category_parameter.dart';

class SubCategoryScreen extends ConsumerWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategoryParameter =
        ModalRoute.of(context)!.settings.arguments as SubCategoryParameter;
    ProductController productController = ProductController(ref);
    SubCategoryController subCategoryController = SubCategoryController(ref);
    List<ProductModel> productList =
        productController.getProductListsByCategoryNameAndSubCategoryName(
            subCategoryParameter.categoryName!, subCategoryParameter.label!);
    SubCategoryModel selectedSubCategory =
        subCategoryController.getSelectedSubCategory(subCategoryParameter.id!);
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(selectedSubCategory.label!),
      ),
      body: CustomBodyContainer(
        error: subCategoryController.hasError,
        errorMessage: subCategoryController.errorMessage,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: ProductColumn(
              title: Text(
                '${productList.length} resultats dans la categorie ${selectedSubCategory.label}',
              ),
              productList: productList,
            ),
          ),
        ),
      ),
    );
  }
}
