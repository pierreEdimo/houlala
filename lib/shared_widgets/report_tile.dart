import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_list_tile.dart';


class ReportTile extends StatelessWidget {
  const ReportTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: InkWell(
        onTap: () {},
        child: const Center(
          child: CustomListTile(
            imageUrl: "",
            title: "reporter",
          ),
        ),
      ),
    );
  }
}
