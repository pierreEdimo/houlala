import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/models/location/location_model.dart';
import 'package:houlala/models/order/order_model.dart';
import 'package:houlala/repositories/location/location_repository.interface.dart';
import 'package:http/http.dart';

class LocationRepository implements LocationRepositoryInterface {
  @override
  Future<List<LocationModel>> fetchLocations() async {
    Response response = await get(Uri.parse('${dotenv.env['LOCATION_URL']}'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<LocationModel> locations = body
          .map((dynamic location) => LocationModel.fromJson(location))
          .toList();

      return locations;
    } else {
      throw 'No Locations';
    }
  }

  @override
  Future<SimpleLocation> fetchSingleLocation(String uniqueIdentifier) async {
    List<LocationModel> locations = await fetchLocations();
    LocationModel singleLocation = locations
        .where((element) => element.uniqueIdentifier == uniqueIdentifier)
        .first;
    return SimpleLocation(
        imageUrl: singleLocation.imageUrl,
        id: singleLocation.id,
        email: singleLocation.email,
        uniqueIdentifier: singleLocation.uniqueIdentifier,
        name: singleLocation.name);
  }
}
