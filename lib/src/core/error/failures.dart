import 'package:equatable/equatable.dart';
import '../constants/failure_messages.dart';

sealed class Failure extends Equatable {
  final String message;
  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

// ~ Authentication Failures ~ //

final class AuthFailure extends Failure {
  const AuthFailure({required super.message});
}

// ~ Network Failures ~ //

final class OfflineFailure extends Failure {
  const OfflineFailure(
      {super.message = FailureMessages.no_internet_connection});
}

// ~ Database Failures ~ //

final class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure(
      {super.message = FailureMessages.permission_denied});
}

final class DatabaseReadFailure extends Failure {
  const DatabaseReadFailure({super.message = FailureMessages.read_failed});
}

final class DatabaseWriteFailure extends Failure {
  const DatabaseWriteFailure({super.message = FailureMessages.write_failed});
}

final class DatabaseUpdateFailure extends Failure {
  const DatabaseUpdateFailure({super.message = FailureMessages.update_failed});
}

final class DatabaseDeleteFailure extends Failure {
  const DatabaseDeleteFailure({super.message = FailureMessages.delete_failed});
}

// ~ Other Failures ~ //

final class UnknownFailure extends Failure {
  const UnknownFailure({super.message = FailureMessages.unknown_error});
}
