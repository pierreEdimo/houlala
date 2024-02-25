import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/models/location/location_model.dart';
import 'package:houlala/repositories/location/location_repository.dart';
import 'package:houlala/state/location/location_model.state.dart';

final locationRepositoryProvider =
    Provider<LocationRepository>((ref) => LocationRepository());

final locationStateNotifierProvider =
    StateNotifierProvider<LocationStateNotifier, LocationModelState>(
        (ref) => LocationStateNotifier(ref.watch(locationRepositoryProvider)));

class LocationStateNotifier extends StateNotifier<LocationModelState> {
  final LocationRepository locationRepository;

  LocationStateNotifier(this.locationRepository) : super(LocationModelState()) {
    loadLocations();
  }

  Future<void> loadLocations() async {
    try {
      state = state.copyWith(loading: true);
      List<LocationModel> locationList =
          await locationRepository.fetchLocations();
      state = state.copyWith(locationList: locationList, loading: false);
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage:
              "impossible d'avoir acces aux boutiques. svp reessayez plutard");
    }
  }
}
