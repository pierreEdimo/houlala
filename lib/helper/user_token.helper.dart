import 'dart:convert';

import 'package:houlala/main.dart';
import 'package:houlala/models/user_token/user_token.dart';

class UserTokenHelper {
  static void saveToken(UserToken token) async {
    String tokenString = jsonEncode(token);
    await storage.write(key: 'userToken', value: tokenString);
  }

  static Future<UserToken?>? getUserToken() async {
    UserToken? token;
    String? userTokenString = await storage.read(key: 'userToken');
    if (userTokenString != null) {
      token = UserToken.fromJson(jsonDecode(userTokenString));
    }
    return token;
  }

  static void deleteToken() async {
    await storage.delete(key: 'userToken');
  }
}
