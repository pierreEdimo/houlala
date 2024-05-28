import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/models/login/login_model.dart';
import 'package:houlala/models/register/register_model.dart';
import 'package:houlala/models/user_model/user_model.dart';
import 'package:houlala/models/user_token/user_token.dart';
import 'package:houlala/repositories/auth/auth_repository.interface.dart';
import 'package:http/http.dart';

class AuthRepository implements AuthRepositoryInterface {
  @override
  Future<UserToken> login(LoginModel login) async {
    final Response response = await post(
        Uri.parse('${dotenv.env['AUTH_URL']}/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(login));
    if (response.statusCode == 202) {
      return UserToken.fromJson(jsonDecode(response.body));
    } else {
      throw 'Login impossible';
    }
  }

  @override
  Future<UserToken> registerUser(RegisterModel register) async {
    final Response response = await post(
        Uri.parse('${dotenv.env['AUTH_URL']}/users/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(register));
    if (response.statusCode == 201) {
      return UserToken.fromJson(jsonDecode(response.body));
    } else {
      throw 'Register impossible';
    }
  }

  @override
  Future<UserModel> fetchConnectUser(UserToken? userToken) async {
    Response response = await get(
        Uri.parse('${dotenv.env['AUTH_URL']}/users/${userToken!.email}'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': userToken.token!
        });
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw 'No User found';
    }
  }
}
