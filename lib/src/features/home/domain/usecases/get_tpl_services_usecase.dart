import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../salon/data/models/salon_service.dart';
import '../repositories/home_repository.dart';

class GetTplServicesUsecase {
  final HomeRepository repository;

  GetTplServicesUsecase(this.repository);

  Future<Either<Failure, List<SalonService>>> call(String categoryId) async {
    return repository.getTPLServices(categoryId);
  }
}
