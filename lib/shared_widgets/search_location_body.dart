import 'package:flutter/material.dart';
import 'package:houlala/shared_widgets/vertical_locatiion_container.dart';
import '../models/location/location_model.dart';

class SearchLocationBody extends StatelessWidget {
  final List<LocationModel>? locationList;

  const SearchLocationBody({
    super.key,
    this.locationList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('${locationList!.length} magasin(s) trouve(s)'),
          const SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: locationList!
                .map(
                  (location) => VerticaLocationContainer(
                    locationModel: location,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
