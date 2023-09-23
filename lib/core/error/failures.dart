import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

// ~ Authentication Failures ~ //

final class AuthFailure extends Failure {
  final String message;
  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// ~ Network Failures ~ //

final class OfflineFailure extends Failure {
  const OfflineFailure();
}

// ~ Database Failures ~ //

final class DatabaseReadFailure extends Failure {
  const DatabaseReadFailure();
}

final class DatabaseWriteFailure extends Failure {
  const DatabaseWriteFailure();
}

final class DatabaseUpdateFailure extends Failure {
  const DatabaseUpdateFailure();
}

final class DatabaseDeleteFailure extends Failure {
  const DatabaseDeleteFailure();
}

// ~ Other Failures ~ //

final class UnknownFailure extends Failure {
  const UnknownFailure();
}
