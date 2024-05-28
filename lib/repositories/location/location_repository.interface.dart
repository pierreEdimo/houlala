import 'package:houlala/models/location/location_model.dart';

import '../../models/order/order_model.dart';

abstract class LocationRepositoryInterface{
  Future<List<LocationModel>> fetchLocations();
  Future<SimpleLocation> fetchSingleLocation(String uniqueIdentifier);
}