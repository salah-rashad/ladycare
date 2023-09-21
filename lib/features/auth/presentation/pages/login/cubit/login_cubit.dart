import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/value_validators.dart';
import '../../../../domain/entities/user_data.dart';
import '../../../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this._loginUsecase) : super(LoginInitial());

  Future<void> login() async {
    final isFormValid = formKey.currentState!.validate();
    if (isFormValid) {
      emit(LoginLoading());
      final result = await _loginUsecase((
        email: emailController.text.trim(),
        password: passwordController.text,
      ));
      final state = result.fold(
        (failure) => LoginError(message: failure.message),
        (userData) {
          passwordController.clear();
          return LoginSucceed(userData: userData);
        },
      );
      emit(state);
    }
  }

  String? emailValidator(String? value) {
    if (value != null) {
      final result =
          validateStringNotEmpty(value).flatMap((a) => validateEmailAddress(a));
      return result.fold(
        (failure) => failure.message,
        (value) => null,
      );
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value != null) {
      final result =
          validateStringNotEmpty(value).flatMap((a) => validatePassword(a));
      return result.fold(
        (failure) => failure.message,
        (value) => null,
      );
    }
    return null;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
