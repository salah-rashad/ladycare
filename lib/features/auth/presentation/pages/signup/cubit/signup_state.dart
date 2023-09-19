part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupError extends SignupState {
  final String message;

  const SignupError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class SignupSucceed extends SignupState {
  final UserData? userData;

  const SignupSucceed({required this.userData});

  @override
  List<Object?> get props => [userData];
}
