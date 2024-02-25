import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/controllers/location_controller.dart';
import 'package:houlala/models/location/location_model.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/shared_widgets/horizontal_location_container.dart';
import 'package:houlala/widget/custom_box_container.dart';

class HomeLocationBox extends ConsumerWidget {
  const HomeLocationBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LocationController locationController = LocationController(ref);
    List<LocationModel> locationList = locationController.locationListWithLimit;
    return CustomBodyContainer(
      loading: locationController.isLoading,
      error: locationController.hasError,
      errorMessage: locationController.errorMessage,
      loadingHeight: 300,
      child: CustomBoxContainer(
        title: 'Decouvrez quelques boutiques disponibles',
        urlValue: 'all_locations',
        child: SizedBox(
          height: 250,
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.horizontal,
            childAspectRatio: 1 / 2.2,
            children: locationList
                .map(
                  (location) => HorizontalLocationContainer(
                    locationModel: location,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
