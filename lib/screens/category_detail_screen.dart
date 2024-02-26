import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/category_name.dart';
import 'package:houlala/shared_widgets/fruits_lettuces_body.dart';
import '../models/page_screen_args/page_screen_arguments.dart';
import '../widget/custom_button_container.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = "/categoryDetail";

  const CategoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PageScreenArguments;

    return Scaffold(
      appBar: AppBar(
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        title: Text(args.categoryName!),
      ),
      body: CategoryDetailBody(
        categoryName: args.categoryName,
      ),
    );
  }
}

class CategoryDetailBody extends StatefulWidget {
  final String? categoryName;

  const CategoryDetailBody({super.key, this.categoryName});

  @override
  State<CategoryDetailBody> createState() => _CategoryDetailBodyState();
}

class _CategoryDetailBodyState extends State<CategoryDetailBody> {
  final ValueNotifier<bool> isLoading$ = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    switch (widget.categoryName) {
      case CategoryName.FRUITS_AND_LETTUCES:
        return FruitsLettucesBody(categoryName: widget.categoryName);
      default:
        return const Center(
          child: Text("There is nothing to see here, Fuck off."),
        );
    }
  }
}
