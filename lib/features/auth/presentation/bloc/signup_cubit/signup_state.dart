part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSucceed extends SignupState {}

final class SignupFailed extends SignupState {
  final String message;

  const SignupFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
