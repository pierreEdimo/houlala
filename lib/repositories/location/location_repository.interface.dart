import 'package:houlala/models/location/location_model.dart';

abstract class LocationRepositoryInterface{
  Future<List<LocationModel>> fetchLocations();
}