import 'dart:convert';

import 'package:houlala/main.dart';
import 'package:houlala/models/user_token/user_token.dart';

class UserTokenHelper{
  static void saveToken(UserToken token) async{
    String tokenString = jsonEncode(token);
    await storage.write(key: 'userToken', value: tokenString);
  }

  static Future<UserToken> getUserToken() async{
    String? userTokenString = await storage.read(key: 'userToken');
    return UserToken.fromJson(jsonDecode(userTokenString!));
  }
}