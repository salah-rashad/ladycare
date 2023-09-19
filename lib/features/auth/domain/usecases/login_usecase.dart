import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/user_data.dart';
import '../repositories/auth_repository.dart';

typedef LoginParams = ({String email, String password});

class LoginUsecase extends Usecase<UserData?, LoginParams> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, UserData?>> call(LoginParams params) async {
    return repository.login(params);
  }
}
