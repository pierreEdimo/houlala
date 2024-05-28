import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/location_controller.dart';
import 'package:houlala/controllers/pcategory_controller.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/models/location/location_model.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/models/product_category/category_model.dart';
import 'package:houlala/providers/word_provider.dart';
import 'package:houlala/shared_widgets/search_category_body.dart';
import 'package:houlala/shared_widgets/search_location_body.dart';
import 'package:houlala/shared_widgets/search_product_body.dart';
import 'package:houlala/shared_widgets/custom_button_container.dart';
import 'package:houlala/shared_widgets/custom_intern_navigation.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String? searchWord = ref.watch(wordStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (value) {
            ref.read(wordStateNotifierProvider.notifier).setWord(value);
          },
          decoration: InputDecoration(
            hintText: "Rechercher",
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: Color(0xff000000),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xff000000),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                controller.clear();
                ref.read(wordStateNotifierProvider.notifier)
                .setWord(controller.text);
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      ),
      body: searchWord!.isEmpty
          ? Container()
          : SearchResultContainer(searchWord: searchWord),
    );
  }
}

class SearchResultContainer extends ConsumerWidget {
  final String? searchWord;

  const SearchResultContainer({
    super.key,
    this.searchWord,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductController productController = ProductController(ref);
    PCategoryController categoryController = PCategoryController(ref);
    LocationController locationController = LocationController(ref);

    List<ProductModel> productList =
        productController.getFilteredProductByName(searchWord!);
    List<CategoryModel> categoryList =
        categoryController.getCategoryListByName(searchWord!);
    List<LocationModel> locationList =
        locationController.getFilteredLocations(searchWord!);

    return CustomInternNavigation(
      menuItems: const ['Produits', 'Categories', 'Magasins'],
      widgetOptions: [
        SearchProductBody(
          productList: productList,
        ),
        SearchCategoryBody(
          categoryList: categoryList,
        ),
        SearchLocationBody(
          locationList: locationList,
        ),
      ],
      elevationValue: 0,
      verticalPadding: 0,
      horizontalPadding: 0,
    );
  }
}
