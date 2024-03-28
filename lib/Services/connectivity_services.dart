// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityServices {
  Future<bool> checkConnectivity() async {
    final result = await (Connectivity().checkConnectivity());
    if (result != ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }
}
