import 'package:dartz/dartz.dart';

import '../error/value_failures.dart';

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isEmpty) {
    return left(EmptyStringValueFailure(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(InvalidEmailValueFailure(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // You can also add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
  if (input.length >= 8) {
    return right(input);
  } else {
    return left(ShortPasswordValueFailure(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePasswordMatch(
    String password, String passwordConfirm) {
  if (password == passwordConfirm) {
    return right(passwordConfirm);
  } else {
    return left(PasswordNotMatchValueFailure(failedValue: passwordConfirm));
  }
}
