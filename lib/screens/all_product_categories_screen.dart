import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/pcategory_controller.dart';
import 'package:houlala/models/product_category/category_model.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/shared_widgets/grid_category_container.dart';

import '../widget/custom_button_container.dart';

class AllProductCategories extends ConsumerWidget {
  const AllProductCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PCategoryController controller = PCategoryController(ref);
    List<CategoryModel> categoryList = controller.categories;
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Categories'),
      ),
      body: CustomBodyContainer(
        error: controller.pCategoryError(),
        errorMessage: controller.getPCategoryErrorMessage(),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          childAspectRatio: 1.1 / 1,
          children: categoryList
              .map(
                (category) => GridCategoryContainer(
                  categoryModel: category,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
