import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/page_screen_arguments.dart';

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
      body: Center(
        child: Text(args.categoryName!),
      ),
    );
  }
}
