import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/failure_messages.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_helper.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../datasources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;
  final NetworkHelper networkHelper;

  AuthRepositoryImpl(this.dataSource, this.networkHelper);

  @override
  Future<Either<Failure, UserCredential>> login(LoginParams params) async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.login(params);
        return Right(data);
      } on AuthException catch (e) {
        return Left(AuthFailure(message: e.message));
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> createAccount(
      SignupParams params) async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.createAccount(params);
        return Right(data);
      } on AuthException catch (e) {
        return Left(AuthFailure(message: e.message));
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.logout();
        return Right(data);
      } on AuthException catch (e) {
        return Left(AuthFailure(message: e.message));
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(
      ResetPasswordParams params) async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.sendPasswordResetEmail(params);
        return Right(data);
      } on AuthException catch (e) {
        return Left(AuthFailure(message: e.message));
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserData>> getUserProfile() async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.getUserProfile();
        return Right(data);
      } on FirebaseException catch (e) {
        final message = FailureMessages.fromCode(e.code);
        return Left(DatabaseReadFailure(message: message));
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }
}
