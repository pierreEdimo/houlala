import 'package:flutter/cupertino.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService extends ChangeNotifier{

  Future<ConnectivityResult> checkConnectivity() async{
    ConnectivityResult? result = await Connectivity().checkConnectivity();
    return result;
  }
}