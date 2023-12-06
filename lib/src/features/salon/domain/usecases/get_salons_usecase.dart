import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/firestore_filter.dart';
import '../../../../core/models/order_by.dart';
import '../../../../core/utils/usecase.dart';
import '../../data/models/salon.dart';
import '../repositories/salon_repository.dart';

class GetSalonsParams {
  final int? limit;
  final OrderBy? orderBy;
  final List<FirestoreFilter>? filters;

  const GetSalonsParams({this.limit, this.orderBy, this.filters});
}

class GetSalonsUsecase extends Usecase<List<Salon>, GetSalonsParams> {
  final SalonRepository salonRepository;
  const GetSalonsUsecase(this.salonRepository);

  @override
  Future<Either<Failure, List<Salon>>> call([GetSalonsParams? params]) {
    return salonRepository.getSalons(params);
  }
}
