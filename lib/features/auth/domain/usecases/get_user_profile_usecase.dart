import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_data.dart';
import '../repositories/auth_repository.dart';

class GetUserProfileUsecase {
  final AuthRepository repository;

  GetUserProfileUsecase(this.repository);

  Future<Either<Failure, UserData>> call() async {
    return repository.getUserProfile();
  }
}
