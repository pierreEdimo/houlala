import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/controllers/location_controller.dart';
import 'package:houlala/shared_widgets/vertical_locatiion_container.dart';

import '../models/location/location_model.dart';

class StoreBody extends ConsumerWidget {
  const StoreBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LocationController locationController = LocationController(ref);
    List<LocationModel> locationList = locationController.locationList;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('${locationList.length} boutique(s) trouvee(s)'),
          const SizedBox(height: 10.0),
          ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: locationList
                  .map((location) => VerticaLocationContainer(
                        locationModel: location,
                      ))
                  .toList())
        ],
      ),
    );
  }
}
