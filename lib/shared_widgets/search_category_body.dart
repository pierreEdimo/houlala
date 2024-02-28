import 'package:flutter/material.dart';
import 'package:houlala/shared_widgets/grid_category_container.dart';

import '../models/product_category/category_model.dart';

class SearchCategoryBody extends StatelessWidget {
  final List<CategoryModel>? categoryList;

  const SearchCategoryBody({
    super.key,
    this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('${categoryList!.length} categorie(s) trouvees.'),
          const SizedBox(height: 10.0),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: categoryList!
                .map(
                  (category) => GridCategoryContainer(
                    categoryModel: category,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
