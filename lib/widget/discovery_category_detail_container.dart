import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/custom_avatar.dart';
import 'package:houlala/widget/transformed_container.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 1,
              child: Stack(
                children: [
                  SizedBox(
                    height: 35.h,
                    child: Container(
                      width: 100.w,
                      color: lightgrey,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomAvatar(
                            radius: 20,
                            thumbnailUrl: thumbNail!,
                          ),
                          Text(
                            name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "PoppinsBold",
                              fontSize: 28.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: !kIsWeb ? null : 70.0,
                    child: AppBarWithReturn(
                      color: Colors.transparent,
                      elevation: 0,
                      title: "",
                    ),
                  )
                ],
              ),
            ),
            TransformedContainer(
              child: GridPages(
                height: 0.4,
                textError:
                    "Nous n'avons encore aucuns magasins dans cette rubrique. Svp reessayez plutard.",
                uri: '${dotenv.env['LOCATION_URL']}/category/$id',
                direction: Axis.vertical,
              ),
            )
          ],
        ),
      ),
    );
  }
}
