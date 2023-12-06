part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class Authenticated extends AuthState {
  final UserData userData;
  const Authenticated({required this.userData});

  @override
  List<Object?> get props => [userData];
}

final class Unauthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
