import 'package:flutter/material.dart';
import 'package:houlala/service/page_service.dart';
import 'package:houlala/widget/custom_intern_navigation.dart';
import 'package:provider/provider.dart';
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
            final List<Widget> widgetOptions = [];

            return SingleChildScrollView(
              child: CustomInternNavigation(
                menuItems: const [
                  "Accueil",
                  "Informations",
                  "Produits",
                ],
                widgetOptions: widgetOptions,
                elevationValue: 0,
                verticalPadding: 23.0,
                horizontalPadding: 0.0,
                height: 0.1,
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
