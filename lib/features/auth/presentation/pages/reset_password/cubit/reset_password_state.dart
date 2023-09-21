part of 'reset_password_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSucceed extends ResetPasswordState {
  final String email;

  const ResetPasswordSucceed({required this.email});

  @override
  List<Object> get props => [email];
}

class ResetPasswordError extends ResetPasswordState {
  final String message;

  const ResetPasswordError({required this.message});

  @override
  List<Object> get props => [message];
}
