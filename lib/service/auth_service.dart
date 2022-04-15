import 'package:flutter/cupertino.dart';

import '../main.dart';

class AuthService extends ChangeNotifier {
  late String loggedState = "loggedOut";

  logIn() {
    box.put('logged', 'loggedIn');
    loggedState = box.get('logged');
    notifyListeners();
  }

  logOut() {
    box.put('logged', 'loggedOut');
    loggedState = box.get('logged');
    notifyListeners();
  }

  getLoggedState() {
    if (box.get('logged') != null) {
      loggedState = box.get('logged');
    }
    return loggedState;
  }
}
