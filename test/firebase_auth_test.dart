// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:ladycare/features/auth/data/datasources/auth_data_source.dart';
// import 'package:ladycare/features/auth/data/models/user_data_model.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   test("Create user", () async {
//     const UserDataModel user = UserDataModel(
//         id: null, email: "sla7.r4ad@gmail.com", name: "Salah Rashad");
//     final auth = MockFirebaseAuth();
//     final db = FakeFirebaseFirestore();
//     final service = AuthDataSourceImpl(auth, db);
//     await service.createAccount(user, "Bb1232123");
//     final result = await service.createAccount(user, "123456");
//     print(result);
//   });
// }
