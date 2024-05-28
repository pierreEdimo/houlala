import 'package:houlala/models/login/login_model.dart';
import 'package:houlala/models/register/register_model.dart';
import 'package:houlala/models/user_model/user_model.dart';
import '../../models/user_token/user_token.dart';

abstract class AuthRepositoryInterface {
  Future<UserToken> login(LoginModel login);
  Future<UserModel> fetchConnectUser(UserToken token);
  Future<UserToken> registerUser(RegisterModel register);
}
