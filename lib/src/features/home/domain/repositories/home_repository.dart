import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../salon/data/models/salon_service.dart';
import '../../../salon/data/models/services_category.dart';
import '../../data/models/highlight.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Highlight>>> getHighlights();
  Future<Either<Failure, List<ServicesCategory>>> getServiceCategories();
  Future<Either<Failure, List<SalonService>>> getTPLServices(String categoryId);
}
