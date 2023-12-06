import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/highlight.dart';
import '../repositories/home_repository.dart';

class GetHighlightsUsecase {
  final HomeRepository repository;
  GetHighlightsUsecase(this.repository);

  Future<Either<Failure, List<Highlight>>> call() async {
    return repository.getHighlights();
  }
}
