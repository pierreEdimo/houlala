import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/helper/user_token.helper.dart';
import 'package:houlala/models/login/login_model.dart';
import 'package:houlala/models/register/register_model.dart';
import 'package:houlala/models/user_model/user_model.dart';
import 'package:houlala/providers/auth_provider.dart';

class AuthController {
  WidgetRef ref;

  AuthController(this.ref);

  void login(String email, String password) {
    LoginModel loginModel = LoginModel(email: email, passWord: password);
    ref.read(authRepositoryStateNotifierProvider.notifier).login(loginModel);
  }

  void registerUser(RegisterModel registerModel) {
    ref
        .read(authRepositoryStateNotifierProvider.notifier)
        .register(registerModel);
  }

  void logout() {
    UserTokenHelper.deleteToken();
    ref.read(authRepositoryStateNotifierProvider.notifier).logout();
  }

  void reloadUser() {
    ref.read(authRepositoryStateNotifierProvider.notifier).loadConnectedUser();
  }

  UserModel? get connectedUser {
    return ref.watch(authRepositoryStateNotifierProvider).connectedUser;
  }

  bool get loading {
    return ref.watch(authRepositoryStateNotifierProvider).loading;
  }

  bool get error {
    return ref.watch(authRepositoryStateNotifierProvider).error;
  }

  String get errorMessage {
    return ref.watch(authRepositoryStateNotifierProvider).errorMessage;
  }
}
