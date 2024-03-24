import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider =
    StateNotifierProvider<ConnectivityNotifier, ConnectivityResult?>(
        (ref) => ConnectivityNotifier());

class ConnectivityNotifier extends StateNotifier<ConnectivityResult?> {
  ConnectivityNotifier() : super(null) {
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    state = result;
  }
}
