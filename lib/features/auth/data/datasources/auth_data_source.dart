import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/failure_messages.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../models/user_data_model.dart';

abstract class AuthDataSource {
  Future<UserDataModel?> login(LoginParams params);
  Future<UserDataModel?> createAccount(SignupParams params);
  Future<Unit> logout();
  Future<UserDataModel?> getUserProfile();
  Future<Unit> sendPasswordResetEmail(ResetPasswordParams params);
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore db;

  AuthDataSourceImpl(this.auth, this.db);

  CollectionReference<UserDataModel> get usersCollectionRef =>
      db.collection("users").withConverter(
            fromFirestore: (snapshot, _) =>
                UserDataModel.fromMap(snapshot.data()!),
            toFirestore: (value, options) => value.toMap(),
          );

  @override
  Future<UserDataModel?> login(LoginParams params) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: params.email, password: params.password);
      return await getUserProfile();
    } on FirebaseAuthException catch (e) {
      final message = FailureMessages.fromCode(e.code);
      log(message, error: e);
      throw AuthException(message, code: e.code);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDataModel?> createAccount(SignupParams params) async {
    try {
      // creating user account
      final credentials = await auth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      final uid = credentials.user?.uid;

      // making document reference type safe
      final docRef = usersCollectionRef.doc(uid);

      // write user data to cloud firestore
      final user = UserDataModel(
        id: uid!,
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        profilePictureUrl: null,
        phoneCountryCode: params.phoneCountryCode,
        phoneNumber: params.phoneNumber,
        dateOfBirth: params.dateOfBirth,
      );
      await docRef.set(user);

      // get user data from cloud firestore
      final doc = await docRef.get();
      return doc.data();
    } on FirebaseAuthException catch (e) {
      final message = FailureMessages.fromCode(e.code);
      log(message, error: e);
      throw AuthException(message, code: e.code);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDataModel?> getUserProfile() async {
    try {
      final uid = auth.currentUser?.uid;
      final docRef = db.collection("users").doc(uid);
      final doc = await docRef
          .withConverter(
            fromFirestore: (snapshot, _) =>
                UserDataModel.fromMap(snapshot.data()!),
            toFirestore: (value, options) => value.toMap(),
          )
          .get();
      return doc.data();
    } catch (e) {
      throw DatabaseReadException();
    }
  }

  @override
  Future<Unit> logout() async {
    try {
      await auth.signOut();
      return unit;
    } catch (e) {
      const message = FailureMessages.logout_failed;
      log(message, error: e);
      throw const AuthException(message);
    }
  }

  @override
  Future<Unit> sendPasswordResetEmail(ResetPasswordParams params) async {
    // TODO: implement this
    throw UnimplementedError();
  }
}
