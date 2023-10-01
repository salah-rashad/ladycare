import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/salon_group.dart';
import '../../../../core/utils/usecase.dart';
import '../repositories/salon_repository.dart';

typedef GetTopRatedSalonsParams = ({int limit});

class GetTopRatedSalonsUsecase
    extends Usecase<List<SalonGroup>, GetTopRatedSalonsParams> {
  final SalonRepository salonRepository;
  GetTopRatedSalonsUsecase(this.salonRepository);

  @override
  Future<Either<Failure, List<SalonGroup>>> call(
      [GetTopRatedSalonsParams? params]) async {
    return salonRepository.getTopRatedSalons(params);
  }
}
