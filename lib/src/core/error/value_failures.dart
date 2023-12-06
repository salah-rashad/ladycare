import 'package:equatable/equatable.dart';
import '../constants/value_failure_messages.dart';

abstract class ValueFailure<T> extends Equatable {
  final T failedValue;
  final String message;
  const ValueFailure({required this.failedValue, required this.message});

  @override
  List<Object?> get props => [failedValue, message];
}

class EmptyStringValueFailure extends ValueFailure<String> {
  const EmptyStringValueFailure({required super.failedValue})
      : super(message: ValueFailureMessages.empty_string);
}

class InvalidEmailValueFailure extends ValueFailure<String> {
  const InvalidEmailValueFailure({required super.failedValue})
      : super(message: ValueFailureMessages.invalid_email);
}

class ShortPasswordValueFailure extends ValueFailure<String> {
  const ShortPasswordValueFailure({required super.failedValue})
      : super(message: ValueFailureMessages.short_password);
}

class PasswordNotMatchValueFailure extends ValueFailure<String> {
  const PasswordNotMatchValueFailure({required super.failedValue})
      : super(message: ValueFailureMessages.password_not_match);
}
