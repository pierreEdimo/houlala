import 'package:houlala/models/login/login_model.dart';
import '../../models/user_token/user_token.dart';

abstract class AuthRepositoryInterface{
  Future<UserToken> login(LoginModel login);
}