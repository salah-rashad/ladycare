import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/user_data.dart';
import '../repositories/auth_repository.dart';

typedef SignupParams = ({
  String firstName,
  String lastName,
  String email,
  String password,
  String phoneCountryCode,
  String phoneNumber,
  DateTime? dateOfBirth,
});

class SignupUsecase extends Usecase<UserData?, SignupParams> {
  final AuthRepository repository;

  SignupUsecase(this.repository);

  @override
  Future<Either<Failure, UserData?>> call(SignupParams params) async {
    return repository.createAccount(params);
  }
}
