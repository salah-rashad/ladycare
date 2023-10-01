// import 'package:connectivity_plus/connectivity_plus.dart';

// enum ConnectivityCase { error, success }

// class MockConnectivity implements Connectivity {
//   var connectivityCase = ConnectivityCase.success;

//   Stream<ConnectivityResult>? _onConnectivityChanged;

//   @override
//   Future<ConnectivityResult> checkConnectivity() {
//     if (connectivityCase == ConnectivityCase.success) {
//       return Future.value(ConnectivityResult.wifi);
//     } else {
//       throw Error();
//     }
//   }

//   @override
//   Stream<ConnectivityResult> get onConnectivityChanged {
//     var onConnectivityChanged = _onConnectivityChanged;
//     onConnectivityChanged ??= Stream<ConnectivityResult>.fromFutures([
//       Future.value(ConnectivityResult.wifi),
//       Future.value(ConnectivityResult.none),
//       Future.value(ConnectivityResult.mobile)
//     ]).asyncMap((data) async {
//       await Future.delayed(const Duration(seconds: 1));
//       return data;
//     });
//     return onConnectivityChanged;
//   }
// }
