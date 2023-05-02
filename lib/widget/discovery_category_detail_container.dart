import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:sizer/sizer.dart';

import 'grid_pages.dart';

class DiscoveryCategoryDetailContainer extends StatelessWidget {
  final int? id;
  final String? name;
  final String? thumbNail;

  const DiscoveryCategoryDetailContainer({
    Key? key,
    this.id,
    this.name,
    this.thumbNail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomBoxContainer(
        child: GridPages(
          height: 70.h,
          textError:
          "Nous n'avons encore aucuns magasins dans cette rubrique. Svp reessayez plutard.",
          uri: '${dotenv.env['LOCATION_URL']}/category/$id',
          direction: Axis.vertical,
        ),
      ),
    );
  }
}
