import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/service/page_service.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/custom_avatar.dart';
import 'package:houlala/widget/custom_intern_navigation.dart';
import 'package:houlala/widget/page_home_container.dart';
import 'package:houlala/widget/page_info_container.dart';
import 'package:houlala/widget/page_product_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
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
                textError: "${page.name} n'a pas encore insere de produits",
                uri:
                    '${dotenv.env['PRODUCT_URL']}/location/${page.uniqueIdentifier}?limit=0',
              )
            ];

            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 35.h,
                        child: Container(
                          width: 100.w,
                          color: const Color.fromRGBO(236, 236, 236, 0.4),
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
                                thumbnailUrl: page.imageUrl!,
                              ),
                              Text(
                                page.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "PoppinsBold",
                                    fontSize: 28.0,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: AppBarWithReturn(
                          title: "",
                          color: Colors.black,
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                  TransformedContainer(
                    child: CustomInternNavigation(
                      menuItems: const [
                        "Accueil",
                        "Informations",
                        "Produits",
                      ],
                      widgetOptions: _widgetOptions,
                      elevationValue: 0,
                      verticalPadding: 23.0,
                      horizontalPadding: 0.0,
                      height: 0.1,
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
