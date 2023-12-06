import 'dart:async';

import 'env.dart';

class EnvDevelopment implements Env {
  @override
  String get name => "Development";

  @override
  bool get useMock => true;

  @override
  FutureOr setupDependencies() {}
}
