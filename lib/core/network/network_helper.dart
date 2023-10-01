import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkHelper {
  Future<bool> get isConnected;

  void onNetworkStateChanged({
    required VoidCallback onConnected,
    required VoidCallback onDisonnected,
  });
}

class InternetConnectionNetworkHelperImpl implements NetworkHelper {
  final InternetConnectionChecker internetConnection;

  InternetConnectionNetworkHelperImpl(this.internetConnection);

  @override
  Future<bool> get isConnected => internetConnection.hasConnection;

  @override
  void onNetworkStateChanged({
    required VoidCallback onConnected,
    required VoidCallback onDisonnected,
  }) =>
      internetConnection.onStatusChange.listen(
        (event) {
          switch (event) {
            case InternetConnectionStatus.connected:
              onConnected();
              break;
            case InternetConnectionStatus.disconnected:
              onDisonnected();
              break;
          }
        },
      );
}

class ConnectivityNetworkHelperImpl implements NetworkHelper {
  final Connectivity connectivity;
  ConnectivityNetworkHelperImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  void onNetworkStateChanged({
    required VoidCallback onConnected,
    required VoidCallback onDisonnected,
  }) {
    connectivity.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        onConnected();
      } else {
        onDisonnected();
      }
    });
  }
}
