import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/address.dart';
import 'package:houlala/model/edit_email.dart';
import 'package:houlala/model/personal_data.dart';
import 'package:houlala/model/register.dart';
import 'package:houlala/model/user_information.dart';
import 'package:http/http.dart';
import '../main.dart';
import '../model/login.dart';

class AuthService extends ChangeNotifier {
  late String loggedState = "loggedOut";

  Future<Response> logIn(Login loginModel) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(loginModel);

    var url = Uri.parse('${dotenv.env['AUTH_URL']}/users/login');
    final Response response = await post(
      url,
      headers: headers,
      body: jsEncode,
    );

    if (response.statusCode == 202) {
      final responseJson = json.decode(response.body);

      storage.write(key: "token", value: responseJson['token']);
      storage.write(key: "userId", value: responseJson['userId']);
      storage.write(key: "email", value: responseJson['email']);

      box.put('logged', 'loggedIn');
      loggedState = box.get('logged');

      notifyListeners();
    }
    return response;
  }

  Future<UserInformation> fetchConnectedUser() async {
    String? email = await storage.read(key: "email");

    var url = Uri.parse('${dotenv.env['AUTH_URL']}/users/$email');

    Response response = await get(url);

    if (response.statusCode == 200) {
      return UserInformation.fromJson(jsonDecode(response.body));
    } else {
      throw "No User found";
    }
  }

  Future<Response> editPersonalData(PersonalData model) async {
    String? email = await storage.read(key: "email");

    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(model);

    var url = Uri.parse('${dotenv.env['AUTH_URL']}/users/singleUser/$email');
    final Response response = await put(
      url,
      headers: headers,
      body: jsEncode,
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      storage.write(key: "token", value: responseJson['token']);
      storage.write(key: "userId", value: responseJson['userId']);
      storage.write(key: "email", value: responseJson['email']);

      box.put('logged', 'loggedIn');
      loggedState = box.get('logged');

      notifyListeners();
    }

    return response;
  }

  Future<Response> editAddressData(Address model) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(model);
    String? email = await storage.read(key: "email");

    var url = Uri.parse('${dotenv.env['AUTH_URL']}/users/address/$email');
    final Response response = await put(
      url,
      headers: headers,
      body: jsEncode,
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      storage.write(key: "token", value: responseJson['token']);
      storage.write(key: "userId", value: responseJson['userId']);
      storage.write(key: "email", value: responseJson['email']);

      box.put('logged', 'loggedIn');
      loggedState = box.get('logged');

      notifyListeners();
    }
    return response;
  }

  Future<Response> editEmail(EditEmail model) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(model);
    String? email = await storage.read(key: "email");

    var url = Uri.parse('${dotenv.env['AUTH_URL']}/users/email/$email');
    final Response response = await put(
      url,
      headers: headers,
      body: jsEncode,
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      storage.write(key: "token", value: responseJson['token']);
      storage.write(key: "userId", value: responseJson['userId']);
      storage.write(key: "email", value: responseJson['email']);

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
    var url = Uri.parse('${dotenv.env['AUTH_URL']}/users/register');
    final Response response = await post(
      url,
      headers: headers,
      body: jsEncode,
    );
    if (response.statusCode == 201) {
      final responseJson = json.decode(response.body);

      storage.write(key: "token", value: responseJson['token']);
      storage.write(key: "userId", value: responseJson['userId']);
      storage.write(key: "email", value: responseJson['email']);

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
    await storage.delete(key: 'email');
    await box.clear();
    notifyListeners();
  }

  getLoggedState() {
    if (box.get('logged') != null) {
      loggedState = box.get('logged');
    }
    return loggedState;
  }
}
