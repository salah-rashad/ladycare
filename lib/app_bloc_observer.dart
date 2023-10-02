import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  final logger = Logger(printer: PrettyPrinter());

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    dev.log('EVENT: (${bloc.runtimeType}) $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    String emoji = "";
    final nextStateType = change.nextState.runtimeType;
    if (nextStateType.toString().contains("Succeed")) {
      emoji = "✅";
    } else if (nextStateType.toString().contains("Failed")) {
      emoji = "❌";
    } else if (nextStateType.toString().contains("Loading")) {
      emoji = "⏰";
    }
    logger.t(
      "CHANGE: (${bloc.runtimeType}) "
      "${change.currentState.runtimeType} ==> $emoji ${change.nextState}",
      stackTrace: StackTrace.fromString(""),
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    dev.log('TRANSITION: (${bloc.runtimeType}) $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e(
      "ERROR: (${bloc.runtimeType})",
      error: error,
      stackTrace: stackTrace,
    );
  }
}
