import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../../data/models/salon.dart';
import '../repositories/salon_repository.dart';

class GetTopRatedSalonsParams {
  final int? limit;

  const GetTopRatedSalonsParams({this.limit});
}

class GetTopRatedSalonsUsecase
    extends Usecase<List<Salon>, GetTopRatedSalonsParams> {
  final SalonRepository salonRepository;
  const GetTopRatedSalonsUsecase(this.salonRepository);

  @override
  Future<Either<Failure, List<Salon>>> call(
      [GetTopRatedSalonsParams? params]) async {
    return salonRepository.getTopRatedSalons(params);
  }
}
