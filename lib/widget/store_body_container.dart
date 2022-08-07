import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sizer/sizer.dart';

import 'grid_pages.dart';
import 'horizontal_d_category_list.dart';

class StoreBodyContainer extends StatelessWidget {
  const StoreBodyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Categories",
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: "PoppinsBold",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.h,
          child: HorizontalStoreCategoryList(
            uri: '${dotenv.env['DISCOVERY_CATEGORY_URL']}/store',
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        GridPages(
          child: const Text(
            "Quelques Magasins",
            style: TextStyle(
                fontFamily: "PoppinsBold",
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          uri: '${dotenv.env['LOCATION_URL']}/store?limit=10',
        )
      ],
    );
  }
}
