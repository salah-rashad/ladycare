import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ladycare/src/core/config/env.dart';
import 'package:ladycare/src/core/config/env_development.dart';
import 'package:ladycare/src/core/config/env_production.dart';
import 'package:ladycare/src/core/config/env_testing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test("Production Environment setup", () async {
    Env.setup(EnvProduction());
    await Env.init();
    
    expect(Env.current?.useMock, false);
    expect(Env.current, isA<EnvProduction>());
    Env.clear();
  });

  test("Development Environment setup", () async {
    Env.setup(EnvDevelopment());
    await Env.init();
    expect(Env.current?.useMock, true);
    expect(Env.current, isA<EnvDevelopment>());
    Env.clear();
  });

  test("Testing Environment setup", () async {
    Env.setup(EnvTesting());
    await Env.init();
    expect(Env.current?.useMock, true);
    expect(Env.current, isA<EnvTesting>());
    Env.clear();
  });
}
