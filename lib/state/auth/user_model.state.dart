import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houlala/models/user_model/user_model.dart';

part 'user_model.state.freezed.dart';

@freezed
class UserModelState with _$UserModelState {
  factory UserModelState({
    @Default(null) UserModel? connectedUser,
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default('') String errorMessage,
  }) = _UserModelState;
}