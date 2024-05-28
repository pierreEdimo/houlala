import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/models/location/location_model.dart';
import 'package:houlala/models/order/order_model.dart';
import 'package:houlala/providers/location_provider.dart';

class LocationController {
  WidgetRef ref;

  LocationController(this.ref);

  List<LocationModel> get locationList {
    return ref.watch(locationStateNotifierProvider).locationList;
  }

  List<LocationModel> get locationListWithLimit {
    return locationList.take(10).toList();
  }

  bool get isLoading {
    return ref.watch(locationStateNotifierProvider).loading;
  }

  String get errorMessage {
    return ref.watch(locationStateNotifierProvider).errorMessage;
  }

  bool get hasError {
    return ref.watch(locationStateNotifierProvider).error;
  }

  LocationModel getSelectedLocationModel(int id) {
    return locationList.firstWhere((element) => element.id == id);
  }

  SimpleLocation getSelectedLocationByUI(String uniqueIdentifier) {
    LocationModel locationModel = locationList
        .firstWhere((element) => element.uniqueIdentifier == uniqueIdentifier);

    return SimpleLocation(
        id: locationModel.id,
        name: locationModel.name,
        imageUrl: locationModel.imageUrl,
        email: locationModel.email,
        uniqueIdentifier: locationModel.uniqueIdentifier);
  }

  List<LocationModel> getFilteredLocations(String keyword) {
    return locationList
        .where((element) =>
            element.name!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}
