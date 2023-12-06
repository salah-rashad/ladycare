import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../repositories/auth_repository.dart';

typedef ResetPasswordParams = ({String email});

class ResetPasswordUsecase extends Usecase<String, ResetPasswordParams> {
  final AuthRepository repository;

  ResetPasswordUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(ResetPasswordParams params) async {
    return repository.resetPassword(params);
  }
}
