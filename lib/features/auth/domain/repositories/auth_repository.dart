import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_data.dart';
import '../usecases/login_usecase.dart';
import '../usecases/reset_password_usecase.dart';
import '../usecases/signup_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserData?>> login(LoginParams params);
  Future<Either<Failure, UserData?>> createAccount(SignupParams params);
  Future<Either<Failure, UserData>> getUserProfile();
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, String>> resetPassword(ResetPasswordParams params);
}
