import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/service_category.dart';
import '../repositories/home_repository.dart';

class GetServiceCategoriesUsecase {
  final HomeRepository repository;

  GetServiceCategoriesUsecase(this.repository);

  Future<Either<Failure, List<ServiceCategory>>> call() async {
    return repository.getServiceCategories();
  }
}
