import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../repositories/auth_repository.dart';

typedef SignupParams = ({
  String firstName,
  String lastName,
  String email,
  String password,
  String phoneNumber,
  DateTime? dateOfBirth,
});

class SignupUsecase extends Usecase<UserCredential, SignupParams> {
  final AuthRepository repository;

  SignupUsecase(this.repository);

  @override
  Future<Either<Failure, UserCredential>> call(SignupParams params) async {
    return repository.createAccount(params);
  }
}
