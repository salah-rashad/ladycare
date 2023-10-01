import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/salon_group.dart';
import '../usecases/get_salons_usecase.dart';
import '../usecases/get_top_rated_salons_usecase.dart';

abstract class SalonRepository {
  Future<Either<Failure, List<SalonGroup>>> getSalons(
      [GetSalonsParams? params]);
  Future<Either<Failure, List<SalonGroup>>> getTopRatedSalons(
      [GetTopRatedSalonsParams? params]);
}
