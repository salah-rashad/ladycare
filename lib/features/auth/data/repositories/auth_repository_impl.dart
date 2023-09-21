import 'package:dartz/dartz.dart';

import '../../../../core/constants/failure_messages.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../datasources/auth_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(this.dataSource, this.networkInfo);

  @override
  Future<Either<Failure, UserData?>> login(LoginParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await dataSource.login(params);
        return Right(data);
      } on AuthException catch (e) {
        return Left(AuthFailure(e.message));
      } catch (e) {
        return const Left(AuthFailure(FailureMessages.unknown_error));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserData?>> createAccount(SignupParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await dataSource.createAccount(params);
        return Right(data);
      } on AuthException catch (e) {
        return Left(AuthFailure(e.message));
      } catch (e) {
        return const Left(AuthFailure(FailureMessages.unknown_error));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await dataSource.logout();
        return const Right(unit);
      } on AuthException catch (e) {
        return Left(AuthFailure(e.message));
      } catch (e) {
        return const Left(AuthFailure(FailureMessages.unknown_error));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(
      ResetPasswordParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await dataSource.sendPasswordResetEmail(params);
        return Right(data);
      } on AuthException catch (e) {
        return Left(AuthFailure(e.message));
      } catch (e) {
        return const Left(AuthFailure(FailureMessages.unknown_error));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserData>> getUserProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await dataSource.getUserProfile();
        return Right(user);
      } on DatabaseReadException {
        return const Left(DatabaseReadFailure());
      } catch (e) {
        return const Left(DatabaseReadFailure(FailureMessages.unknown_error));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }
}
