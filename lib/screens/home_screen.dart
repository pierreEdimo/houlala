import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/category_name.dart';
import 'package:houlala/shared_widgets/home_category_box.dart';
import 'package:houlala/shared_widgets/home_location_box.dart';
import 'package:houlala/shared_widgets/home_product_box.dart';
import 'package:houlala/shared_widgets/container_wirth_connectivity_checker.dart';
import '../helper/constants.dart';
import '../shared_widgets/custom_button_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 35,
          backgroundImage: AssetImage('images/houlala1.png'),
        ),
        title: const Text("Houlala"),
        actions: [
          CustomButtonContainer(
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
            onPressed: () => Navigator.of(context).pushNamed("/search"),
          )
        ],
      ),
      body: const ContainerWithConnectivityChecker(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HomeCategoryBox(),
                standardSizedBox,
                HomeProductByCategoryBox(
                  categoryName: CategoryName.fruitsAndLettuces,
                  titleBox: 'Decouvrez nos fruits et legumes',
                ),
                standardSizedBox,
                HomeLocationBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
