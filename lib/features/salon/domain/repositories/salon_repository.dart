import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/salon.dart';
import '../../data/models/salon_service.dart';
import '../../data/models/services_category.dart';
import '../usecases/get_salons_usecase.dart';
import '../usecases/get_top_rated_salons_usecase.dart';
import '../usecases/search_salons_usecase.dart';

abstract class SalonRepository {
  Future<Either<Failure, List<Salon>>> getSalons([GetSalonsParams? params]);
  Future<Either<Failure, List<Salon>>> getTopRatedSalons(
      [GetTopRatedSalonsParams? params]);
  Future<Either<Failure, List<ServicesCategory>>> getTPLServiceCategories();
  Future<Either<Failure, List<SalonService>>> getTPLServices();
  Future<Either<Failure, List<Salon>>> search([SalonSearchParams? params]);
}
