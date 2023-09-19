import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/service/page_service.dart';
import 'package:houlala/widget/custom_intern_navigation.dart';
import 'package:houlala/widget/page_home_container.dart';
import 'package:houlala/widget/page_info_container.dart';
import 'package:houlala/widget/page_product_container.dart';
import 'package:provider/provider.dart';
import '../model/location.dart';
import 'custom_box_container.dart';

class PageDetailContainer extends StatelessWidget {
  final String? uri;

  const   PageDetailContainer({Key? key, this.uri}) : super(key: key);

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
                    '${dotenv.env['PRODUCT_URL']}/locations/${page.uniqueIdentifier}/size/0',
              )
            ];

            return SingleChildScrollView(
              child: CustomBoxContainer(
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
