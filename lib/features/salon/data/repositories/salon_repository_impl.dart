import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../core/constants/failure_messages.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_helper.dart';
import '../../domain/entities/salon_group.dart';
import '../../domain/repositories/salon_repository.dart';
import '../../domain/usecases/get_salons_usecase.dart';
import '../../domain/usecases/get_top_rated_salons_usecase.dart';
import '../datasources/salon_data_source.dart';

class SalonRepositoryImpl implements SalonRepository {
  final SalonDataSource dataSource;
  final NetworkHelper networkHelper;

  SalonRepositoryImpl(this.dataSource, this.networkHelper);

  @override
  Future<Either<Failure, List<SalonGroup>>> getSalons(
      [GetSalonsParams? params]) async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.getSalons(params);
        return Right(data);
      } on FirebaseException catch (e) {
        final message = FailureMessages.fromCode(e.code);
        return Left(DatabaseReadFailure(message: message));
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<SalonGroup>>> getTopRatedSalons(
      [GetTopRatedSalonsParams? params]) async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.getTopRatedSalons(params);
        return Right(data);
      } on FirebaseException catch (e) {
        final message = FailureMessages.fromCode(e.code);
        return Left(DatabaseReadFailure(message: message));
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }
}
