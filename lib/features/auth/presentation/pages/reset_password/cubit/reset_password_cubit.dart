import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/value_validators.dart';
import '../../../../domain/usecases/reset_password_usecase.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase _resetPasswordUsecase;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  ResetPasswordCubit(this._resetPasswordUsecase)
      : super(ResetPasswordInitial());

  Future<void> resetPassword() async {
    final isFormValid = formKey.currentState!.validate();
    if (isFormValid) {
      emit(ResetPasswordLoading());
      final result =
          await _resetPasswordUsecase((email: emailController.text.trim()));
      final state = result.fold(
        (failure) => ResetPasswordError(message: failure.message),
        (email) {
          return ResetPasswordSucceed(email: email);
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
}
