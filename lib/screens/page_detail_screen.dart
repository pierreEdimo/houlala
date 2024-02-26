import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/widget/custom_button_container.dart';
import 'package:houlala/widget/custom_intern_navigation.dart';
import 'package:houlala/widget/page_home_container.dart';
import 'package:houlala/widget/page_info_container.dart';
import 'package:houlala/widget/page_product_container.dart';
import '../controllers/location_controller.dart';
import '../helper/constants.dart';
import '../models/location/location_model.dart';

class PageDetailScreen extends ConsumerStatefulWidget {
  static const routeName = '/locationDetail';

  const PageDetailScreen({super.key});

  @override
  ConsumerState<PageDetailScreen> createState() => _PadeDetailScreenState();
}

class _PadeDetailScreenState extends ConsumerState<PageDetailScreen> {
  final ValueNotifier<bool> isLoading$ = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _updateLoading();
  }

  void _updateLoading() {
    Future.delayed(const Duration(seconds: 1), () async {
      isLoading$.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocationController locationController = LocationController(ref);
    final locationId = ModalRoute.of(context)!.settings.arguments as int;
    LocationModel selectedLocation =
        locationController.getSelectedLocationModel(locationId);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(selectedLocation.name!),
      ),
      body: ValueListenableBuilder(
        valueListenable: isLoading$,
        builder: (context, value, child) {
          if (value != true) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 2.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: lightgrey,
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  selectedLocation.imageUrl!,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedLocation.name!,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                  ),
                                  Text('${selectedLocation.productTotalCount} produits disponibles'),
                                  Text('${selectedLocation.orderSoldCount} commandes reussies')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomBodyContainer(
                    error: locationController.hasError,
                    errorMessage: locationController.errorMessage,
                    child: CustomInternNavigation(
                      menuItems: const ["Accueil", "Informations", "Produits"],
                      widgetOptions: [
                        PageHomeContainer(pageModel: selectedLocation),
                        PageInfoContainer(page: selectedLocation),
                        PageProductContainer(locationName: selectedLocation.name)
                      ],
                      elevationValue: 0,
                      verticalPadding: 0,
                      horizontalPadding: 0,
                    ),
                  ),
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
