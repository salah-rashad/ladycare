import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/highlight.dart';
import '../entities/service_category.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Highlight>>> getHighlights();
  Future<Either<Failure, List<ServiceCategory>>> getServiceCategories();
}
