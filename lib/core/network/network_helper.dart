import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkHelper {
  Future<bool> get isConnected;
  void onNetworkStatusChange(void Function(InternetStatus status) onData);
}

class NetworkInfoImpl implements NetworkHelper {
  final InternetConnection internetConnection;

  NetworkInfoImpl(this.internetConnection);

  @override
  Future<bool> get isConnected => internetConnection.hasInternetAccess;

  @override
  void onNetworkStatusChange(void Function(InternetStatus status) onData) =>
      internetConnection.onStatusChange.listen(onData);
}
