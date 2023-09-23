import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/highlight.dart';

abstract class HomeRepository {
  Either<Failure, List<Highlight>> getHighlights();
  
}
