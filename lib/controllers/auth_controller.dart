import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/models/login/login_model.dart';
import 'package:houlala/providers/auth_provider.dart';

class AuthController {
  WidgetRef ref;

  AuthController(this.ref);

  void login(String email, String password) {
    LoginModel loginModel = LoginModel(email: email, passWord: password);
    ref.read(authRepositoryStateNotifier.notifier).login(loginModel);
  }
}
