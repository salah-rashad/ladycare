import 'package:equatable/equatable.dart';

abstract class ValueObject extends Equatable {
  final String input;
  const ValueObject(this.input);

  @override
  List<Object?> get props => [input];
}

class EmailAddress extends ValueObject {
  const EmailAddress(super.value);
}
