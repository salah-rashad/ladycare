// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:ladycare/core/error/failures.dart';
// import 'package:ladycare/core/network/network_helper.dart';
// import 'package:ladycare/features/auth/data/datasources/auth_data_source.dart';
// import 'package:ladycare/features/auth/data/repositories/auth_repository_impl.dart';

// import 'mocks/mock_connectivity.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final auth = MockFirebaseAuth();
//   final db = FakeFirebaseFirestore();
//   final authDataSource = AuthDataSourceImpl(auth, db);
//   final connectivity = MockConnectivity();
//   final networkHelper = ConnectivityNetworkHelperImpl(connectivity);
//   final authRepository = AuthRepositoryImpl(authDataSource, networkHelper);

//   test("Create new user account", () async {
//     const email = "sla7.r4ad@gmail.com";
//     const password = "12345678";
//     const firstName = "Salah";
//     const lastName = "Rashad";
//     const phoneNumber = "+966123456789";

//     final either = await authRepository.createAccount((
//       email: email,
//       firstName: firstName,
//       lastName: lastName,
//       password: password,
//       phoneNumber: phoneNumber,
//       dateOfBirth: DateTime.now(),
//     ));

//     final result = either.fold(
//       (failure) => failure,
//       (credentials) => credentials,
//     );

//     expect(result, isNot(Failure));
//   });

//   test("Login user", () async {
//     const email = "sla7.r4ad@gmail.com";
//     const password = "12345678";

//     final either = await authRepository.login((
//       email: email,
//       password: password,
//     ));

//     final result = either.fold(
//       (failure) => failure,
//       (credentials) => credentials,
//     );

//     expect(result, isNot(Failure));
//   });

//   test("Login user (wrong password)", () async {
//     const email = "sla7.r4ad@gmail.com";
//     const password = "";

//     final either = await authRepository.login((
//       email: email,
//       password: password,
//     ));

//     final result = either.fold(
//       (failure) => failure,
//       (credentials) => credentials,
//     );

//     expect(result, isA<Failure>());
//   });
// }

// // class MockConnectivity implements Connectivity {
// //   @override
// //   Future<ConnectivityResult> checkConnectivity({bool? a}) async {
// //     if (a == true) {
// //       return ConnectivityResult.wifi;
// //     } else {
// //       return ConnectivityResult.none;
// //     }
// //   }

// //   @override
// //   Stream<ConnectivityResult> get onConnectivityChanged async* {
// //     yield ConnectivityResult.wifi;
// //   }
// // }
