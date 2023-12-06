import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../salon/data/models/services_category.dart';
import '../repositories/home_repository.dart';

class GetTplServiceCategoriesUsecase {
  final HomeRepository repository;
  GetTplServiceCategoriesUsecase(this.repository);

  Future<Either<Failure, List<ServicesCategory>>> call() async {
    return repository.getServiceCategories();
  }
}
