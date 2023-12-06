import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../../injection_container.dart' as di;

final sl = GetIt.instance;

abstract interface class _Env {
  String get name;
  bool get useMock;
  FutureOr setupDependencies();
}

abstract class Env implements _Env {
  static Env? _current;

  static Env? get current => _current;

  static void setup(Env environment) {
    _current ??= environment;
  }

  static Future<void> init() async {
    final Logger logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 120,
        colors: true,
        printEmojis: false,
        printTime: false,
        noBoxingByDefault: true,
      ),
    );

    final Env? current = _current;

    if (current == null) {
      throw Exception("Environment not set, call `setup()` first");
    }

    logger.i(
        "🚀 Environment: ${current.name} ${current.useMock ? "(Mock)" : ""}");

    // Set up dependencies
    await current.setupDependencies();

    // Set up app dependencies
    await di.setupAppDependencies();

    logger.d("✅ Dependencies setup");
  }

  static void clear() {
    _current = null;
    sl.reset();
  }
}
