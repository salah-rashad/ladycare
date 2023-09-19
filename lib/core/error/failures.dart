import 'package:equatable/equatable.dart';

import '../constants/failure_messages.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class OfflineFailure extends Failure {
  const OfflineFailure(
      [super.message = FailureMessages.no_internet_connection]);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class DatabaseReadFailure extends Failure {
  const DatabaseReadFailure([super.message = FailureMessages.read_failed]);
}

class DatabaseWriteFailure extends Failure {
  const DatabaseWriteFailure([super.message = FailureMessages.write_failed]);
}

class DatabaseUpdateFailure extends Failure {
  const DatabaseUpdateFailure([super.message = FailureMessages.update_failed]);
}

class DatabaseDeleteFailure extends Failure {
  const DatabaseDeleteFailure([super.message = FailureMessages.delete_failed]);
}

/* class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);

  @override
  List<Object?> get props => [];
}
 */
