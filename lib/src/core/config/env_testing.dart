import 'dart:async';

import 'env.dart';

class EnvTesting implements Env {
  @override
  String get name => "Testing";

  @override
  bool get useMock => true;

  @override
  FutureOr setupDependencies() {}
}
