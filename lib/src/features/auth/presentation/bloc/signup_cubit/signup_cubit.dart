import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/value_validators.dart';
import '../../../domain/usecases/signup_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUsecase _signupUsecase;

  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final phoneCountryCode = Constants.saudiArabiaPhoneCountryCode;
  DateTime? dateOfBirth;

  SignupCubit(this._signupUsecase) : super(SignupInitial());

  Future<void> signup() async {
    final isFormValid = formKey.currentState!.validate();
    if (isFormValid) {
      emit(SignupLoading());

      final phoneNumber =
          phoneCountryCode + phoneNumberController.text.replaceAll(" ", "");

      final result = await _signupUsecase((
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth,
      ));

      final state = result.fold(
        (failure) => SignupFailed(message: failure.message),
        (credentials) {
          clearAllFields();
          return SignupSucceed();
        },
      );

      emit(state);
    }
  }

  void clearAllFields() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    phoneNumberController.clear();
  }

  String? nameValidator(String? value) {
    if (value != null) {
      final result = validateStringNotEmpty(value);
      return result.fold(
        (failure) => failure.message,
        (value) => null,
      );
    }
    return null;
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

  String? passwordConfirmValidator(String? value) {
    if (value != null) {
      final result = validateStringNotEmpty(value)
          .flatMap((a) => validatePasswordMatch(passwordController.text, a));
      return result.fold(
        (failure) => failure.message,
        (value) => null,
      );
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value != null) {
      final result = validateStringNotEmpty(value);
      return result.fold(
        (failure) => failure.message,
        (value) => null,
      );
    }
    return null;
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    phoneNumberController.dispose();

    return super.close();
  }
}
