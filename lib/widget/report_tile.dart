import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'custom_list_tile.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: InkWell(
        onTap: () {},
        child: const Center(
          child: CustomListTile(
            leadingIcon: FontAwesomeIcons.flag,
            title: "reporter",
            icon: Text(""),
          ),
        ),
      ),
    );
  }
}
