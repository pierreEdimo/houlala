import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/blur_container.dart';
import 'package:houlala/service/page_service.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/intern_navigation.dart';
import 'package:houlala/widget/page_home_container.dart';
import 'package:houlala/widget/page_info_container.dart';
import 'package:houlala/widget/page_post_container.dart';
import 'package:houlala/widget/page_product_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../helper/constants.dart';
import '../model/location.dart';

class PageDetailContainer extends StatelessWidget {
  final String? uri;

  const PageDetailContainer({Key? key, this.uri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<LocationService>(context).fetchSingleLocation(uri!),
        builder: (context, AsyncSnapshot<LocationModel> snapshot) {
          if (snapshot.hasData) {
            LocationModel page = snapshot.data!;

            final List<Widget> _widgetOptions = [
              PageHomeContainer(
                pageModel: page,
              ),
              PageInfoContainer(
                page: page,
              ),
              PageProductContainer(
                textError: "${page.name} n'a pas encore insere de produits\n"
                    "svp verifiez plutard",
                uri:
                    '${dotenv.env['PRODUCT_URL']}/location/${page.uniqueIdentifier}?limit=0',
              ),
              PagePostContainer(
                textError: "${page.name} n'a pas encore insere de posts\n"
                    "svp venez verifier plutard",
                url:
                    '${dotenv.env['POST_URL']}/location/${page.uniqueIdentifier!}',
              ),
            ];

            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 35.h,
                        child: BackgroundImage(
                          borderRadius: 0,
                          imageUrl: page.imageUrl,
                        ),
                      ),
                      const BlurContainer(),
                      SizedBox(
                        height: !kIsWeb ? null : 70.0,
                        child: AppBarWithReturn(
                          title: "",
                          color: Colors.transparent,
                          elevation: 0,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            page.name!,
                            style: detailTitleStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                  TransformedContainer(
                    child: InternNavigation(
                      elevationValue: 0,
                      children: _widgetOptions,
                      menuItems: const [
                        "Accueil",
                        "A Propos",
                        "Produits",
                        "Annonces",
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
