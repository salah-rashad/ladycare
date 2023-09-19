part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {
  final String message;

  const LoginError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class LoginSucceed extends LoginState {
  final UserData? userData;

  const LoginSucceed({required this.userData});

  @override
  List<Object?> get props => [userData];
}
