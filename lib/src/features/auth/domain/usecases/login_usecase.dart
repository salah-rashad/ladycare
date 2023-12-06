import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../repositories/auth_repository.dart';

typedef LoginParams = ({String email, String password});

class LoginUsecase extends Usecase<UserCredential, LoginParams> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, UserCredential>> call(LoginParams params) async {
    return repository.login(params);
  }
}
