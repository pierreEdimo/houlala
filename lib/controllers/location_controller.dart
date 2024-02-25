import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/models/location/location_model.dart';
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
}
