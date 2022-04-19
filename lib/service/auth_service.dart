import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:houlala/model/register.dart';
import 'package:http/http.dart';

import '../main.dart';
import '../model/login.dart';

class AuthService extends ChangeNotifier {
  late String loggedState = "loggedOut";

  Future<Response> logIn(Login loginModel) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(loginModel);

    var url =
        Uri.parse('https://houlala.herokuapp.com/api/authentication/login');
    final Response response = await post(
      url,
      headers: headers,
      body: jsEncode,
    );

    if (response.statusCode == 201) {
      final responseJson = json.decode(response.body);
      storage.write(key: "token", value: responseJson['token']);
      storage.write(key: "userId", value: responseJson['user']['_id']);
      box.put('logged', 'loggedIn');
      loggedState = box.get('logged');
      notifyListeners();
    }
    return response;
  }

  Future<Response> register(Register newUser) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(newUser);
    var url =
        Uri.parse('https://houlala.herokuapp.com/api/authentication/register');
    final Response response = await post(
      url,
      headers: headers,
      body: jsEncode,
    );
    if (response.statusCode == 201) {
      final responseJson = json.decode(response.body);
      storage.write(key: "token", value: responseJson['token']);
      storage.write(key: "userId", value: responseJson['user']['_id']);
      box.put('logged', 'loggedIn');
      loggedState = box.get('logged');
      notifyListeners();
    }
    return response;

  }

  Future<String> getUserID() async {
    String? userId = await storage.read(key: "userId");
    if (userId!.isEmpty) {
      return "";
    }
    return userId;
  }

  logOut() async {
    box.put('logged', 'loggedOut');
    loggedState = box.get('logged');
    await storage.delete(key: 'userId');
    await storage.delete(key: 'token');
    notifyListeners();
  }

  getLoggedState() {
    if (box.get('logged') != null) {
      loggedState = box.get('logged');
    }
    return loggedState;
  }
}
