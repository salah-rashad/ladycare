import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/salon_group.dart';
import '../repositories/salon_repository.dart';

class OrderBy {
  final Object field;
  final bool descending;

  OrderBy(this.field, {this.descending = false});
}

class GetSalonsParams {
  final int? limit;
  final OrderBy? orderBy;

  GetSalonsParams({this.limit, this.orderBy});
}

class GetSalonsUsecase extends Usecase<List<SalonGroup>, GetSalonsParams> {
  final SalonRepository salonRepository;
  GetSalonsUsecase(this.salonRepository);

  @override
  Future<Either<Failure, List<SalonGroup>>> call([GetSalonsParams? params]) {
    return salonRepository.getSalons(params);
  }
}
