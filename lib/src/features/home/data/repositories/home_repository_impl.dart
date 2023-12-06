import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../core/constants/failure_messages.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_helper.dart';
import '../../../salon/data/models/salon_service.dart';
import '../../../salon/data/models/services_category.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_source.dart';
import '../models/highlight.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;
  final NetworkHelper networkHelper;
  HomeRepositoryImpl(this.dataSource, this.networkHelper);

  @override
  Future<Either<Failure, List<Highlight>>> getHighlights() async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.getHighlights();
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
  Future<Either<Failure, List<ServicesCategory>>> getServiceCategories() async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.getTPLServiceCategories();
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
  Future<Either<Failure, List<SalonService>>> getTPLServices(
      String categoryId) async {
    if (await networkHelper.isConnected) {
      try {
        final data = await dataSource.getTPLServices(categoryId);
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
