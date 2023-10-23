import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/failure_messages.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../models/user_data.dart';

abstract class AuthDataSource {
  Future<UserCredential> login(LoginParams params);
  Future<UserCredential> createAccount(SignupParams params);
  Future<Unit> logout();
  Future<UserData> getUserProfile();
  Future<String> sendPasswordResetEmail(ResetPasswordParams params);
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore db;

  const AuthDataSourceImpl(this.auth, this.db);

  CollectionReference<UserData> get usersCollectionRef =>
      db.collection(FC.cUsers).withUserDataConverter();

  @override
  Future<UserCredential> login(LoginParams params) async {
    try {
      final credentials = await auth.signInWithEmailAndPassword(
          email: params.email, password: params.password);
      return credentials;
    } on FirebaseAuthException catch (e) {
      final message = FailureMessages.fromCode(e.code);
      throw AuthException(message, code: e.code);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> createAccount(SignupParams params) async {
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
      final user = UserData(
        id: uid!,
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        profilePictureUrl: "",
        phoneNumber: params.phoneNumber,
        dateOfBirth: params.dateOfBirth,
      );
      await docRef.set(user);

      return credentials;
    } on FirebaseException catch (e) {
      final message = FailureMessages.fromCode(e.code);
      throw AuthException(message, code: e.code);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserData> getUserProfile() async {
    try {
      final uid = auth.currentUser?.uid;
      final docRef = usersCollectionRef.doc(uid);
      final doc = await docRef.get();
      return doc.data()!;
    } on FirebaseException catch (e) {
      final message = FailureMessages.fromCode(e.code);
      throw AuthException(message, code: e.code);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> logout() async {
    try {
      await auth.signOut();
      return unit;
    } on FirebaseException catch (e) {
      final message = FailureMessages.fromCode(e.code);
      throw AuthException(message, code: e.code);
    } catch (e) {
      const message = FailureMessages.logout_failed;
      throw const AuthException(message);
    }
  }

  @override
  Future<String> sendPasswordResetEmail(ResetPasswordParams params) async {
    try {
      await auth.sendPasswordResetEmail(email: params.email);
      return params.email;
    } on FirebaseException catch (e) {
      final message = FailureMessages.fromCode(e.code);
      throw AuthException(message, code: e.code);
    } catch (e) {
      rethrow;
    }
  }
}
