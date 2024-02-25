import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/location/location_model.dart';

part 'location_model.state.freezed.dart';

@freezed
class LocationModelState with _$LocationModelState {
  factory LocationModelState(
      {@Default([]) List<LocationModel> locationList,
      @Default(false) bool loading,
      @Default('') String errorMessage,
      @Default(false) bool error}) = _LocationModelState;
}
