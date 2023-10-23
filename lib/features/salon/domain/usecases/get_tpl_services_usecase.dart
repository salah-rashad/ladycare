import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/salon_service.dart';
import '../repositories/salon_repository.dart';

class GetTplServicesUsecase {
  final SalonRepository repository;
  const GetTplServicesUsecase(this.repository);

  Future<Either<Failure, List<SalonService>>> call() async {
    return repository.getTPLServices();
  }
}
