import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_helper.dart';
import '../../domain/entities/highlight.dart';
import '../../domain/entities/service_category.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;
  final NetworkHelper networkInfo;
  HomeRepositoryImpl(this.dataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Highlight>>> getHighlights() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await dataSource.getHighlights();
        return Right(data);
      } on DatabaseReadException {
        return const Left(DatabaseReadFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<ServiceCategory>>> getServiceCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await dataSource.getServiceCategories();
        return Right(data);
      } on DatabaseReadException {
        return const Left(DatabaseReadFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }
}
