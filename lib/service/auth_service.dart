import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:houlala/boxes.dart';
import 'package:houlala/model/personal_datas.dart';
import 'package:houlala/model/register.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../main.dart';
import '../model/address.dart';
import '../model/login.dart';

class AuthService extends ChangeNotifier {
  late String loggedState = "loggedOut";
  final _userBox = HiveBoxes.getUser();
  final _addressBox = HiveBoxes.getAddress();

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

      if (!kIsWeb) {
        storage.write(key: "token", value: responseJson['token']);
        storage.write(key: "userId", value: responseJson['user']['_id']);
      } else {
        userIdBox.put("userId", responseJson['user']['_id']);
      }

      PersonalData user = PersonalData(
        email: responseJson['user']['email'],
        telephoneNumber: responseJson['user']['telephoneNumber'],
        firstName: responseJson['user']['firstname'],
        lastName: responseJson['user']['lastname'],
      );

      Address address = Address(
          country: responseJson['user']['address']['country'],
          city: responseJson['user']['address']['city'],
          poBox: responseJson['user']['address']['poBox'],
          streetName: responseJson['user']['address']['streetName']);

      _userBox.put('ćonnectedUser', user);
      _addressBox.put('userAddress', address);

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

      if (!kIsWeb) {
        storage.write(key: "token", value: responseJson['token']);
        storage.write(key: "userId", value: responseJson['user']['_id']);
      } else {
        userIdBox.put("userId", responseJson['user']['_id']);
      }


      PersonalData user = PersonalData(
        email: responseJson['user']['email'],
        telephoneNumber: responseJson['user']['telephoneNumber'],
        firstName: responseJson['user']['firstname'],
        lastName: responseJson['user']['lastname'],
      );

      Address address = Address(
          country: responseJson['user']['address']['country'],
          city: responseJson['user']['address']['city'],
          poBox: responseJson['user']['address']['poBox'],
          streetName: responseJson['user']['address']['streetName']);

      _userBox.put('connectedUser', user);
      _addressBox.put('userAddress', address);

      box.put('logged', 'loggedIn');
      loggedState = box.get('logged');

      notifyListeners();
    }
    return response;
  }

  PersonalData getUserData() {
    PersonalData? user = PersonalData();
    user = _userBox.get('ćonnectedUser');
    return user!;
  }

  Address getAddress() {
    Address? address = Address();
    address = _addressBox.get('userAddress');
    return address!;
  }

  Future<String> getUserID() async {
    String? userId = "";

    if(!kIsWeb){
      userId = await storage.read(key: "userId");
    } else {
      userId = userIdBox.get("userId");
    }

    if (userId!.isEmpty) {
      return "";
    }
    return userId;
  }

  logOut() async {
    box.put('logged', 'loggedOut');
    userIdBox.put("userId", null); 
    loggedState = box.get('logged');
    await storage.delete(key: 'userId');
    await storage.delete(key: 'token');
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
