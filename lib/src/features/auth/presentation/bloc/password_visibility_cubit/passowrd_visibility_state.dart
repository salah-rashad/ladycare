part of 'passowrd_visibility_cubit.dart';

sealed class PassowrdVisibilityState extends Equatable {
  const PassowrdVisibilityState();

  @override
  List<Object> get props => [];
}

final class PasswordVisible extends PassowrdVisibilityState {}

final class PasswordInvisible extends PassowrdVisibilityState {}
