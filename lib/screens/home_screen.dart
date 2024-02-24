import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/category_name.dart';
import 'package:houlala/shared_widgets/home_category_box.dart';
import 'package:houlala/shared_widgets/home_product_box.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/grid_pages.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:sizer/sizer.dart';
import '../helper/constants.dart';
import '../widget/custom_button_container.dart';

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
      body: ContainerWithConnectivityChecker(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HomeCategoryBox(),
                standardSizedBox,
                const HomeProductByCategoryBox(
                  categoryName: CategoryName.FRUITS_AND_LETTUCES,
                  titleBox: 'Decouvrez nos fruits et legumes',
                ),
                standardSizedBox,
                CustomBoxContainer(
                  title: "Decouvrez quelques boutiques disponibles",
                  urlValue: "all_pages",
                  child: SizedBox(
                    height: 220,
                    child: GridPages(
                      height: 25.h,
                      width: 90.w,
                      textError: "Aucunes Pages",
                      uri: '${dotenv.env['LOCATION_URL']}/store?limit=10',
                      direction: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
