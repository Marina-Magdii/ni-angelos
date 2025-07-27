import 'package:connectivity_plus/connectivity_plus.dart';

bool isAdmin() {
  return true;
}

Future<bool> isConnected() async {
  List<ConnectivityResult> connections =
      await Connectivity().checkConnectivity();
  bool isConnected =
      connections.contains(ConnectivityResult.wifi) ||
      connections.contains(ConnectivityResult.mobile);
  return isConnected;
}
