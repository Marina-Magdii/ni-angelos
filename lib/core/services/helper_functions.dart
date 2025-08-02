import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

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
double heightOfScreen(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return screenHeight;
}

double widthOfScreen(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth;
}