import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({
    String? id,
    String? name,
    String? city,
    String? email,
    String? phoneNumber,
    String? streetName,
    String? poBox,
    String? houseNumber,
    String? userName,
    String? firstName,
    String? lastName,
}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}