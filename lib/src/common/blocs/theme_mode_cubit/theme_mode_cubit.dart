import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(const ThemeModeInitial()) {
    _updateStatusBarBrightness(state.mode);
    _listenToSystemBrightnessChanges();
  }

  PlatformDispatcher get platformDispatcher =>
      SchedulerBinding.instance.platformDispatcher;

  Brightness get systemBrightness => platformDispatcher.platformBrightness;

  bool get isDarkMode => state.mode == ThemeMode.dark;

  String get currentModeName => switch (state.mode) {
        ThemeMode.system => "النظام",
        ThemeMode.light => "فاتح",
        ThemeMode.dark => "داكن",
      };

  void setThemeMode(ThemeMode themeMode) {
    emit(ThemeModeState(mode: themeMode));
  }

  void setThemeModeFromBrightness(Brightness brightness) {
    if (brightness == Brightness.light) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }

  void toggle() {
    switch (state.mode) {
      case ThemeMode.system:
        systemBrightness == Brightness.light
            ? setThemeMode(ThemeMode.dark)
            : setThemeMode(ThemeMode.light);
        break;
      case ThemeMode.light:
        setThemeMode(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        setThemeMode(ThemeMode.light);
        break;
    }
  }

  @override
  void onChange(Change<ThemeModeState> change) {
    super.onChange(change);
    final nextMode = change.nextState.mode;
    _updateStatusBarBrightness(nextMode);
  }

  void _updateStatusBarBrightness(ThemeMode mode) {
    final brightness = switch (mode) {
      ThemeMode.system => systemBrightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      ThemeMode.light => Brightness.dark,
      ThemeMode.dark => Brightness.light,
    };
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness,
        statusBarBrightness: brightness,
      ),
    );
  }

  void _listenToSystemBrightnessChanges() {
    platformDispatcher.onPlatformBrightnessChanged =
        () => setThemeModeFromBrightness(systemBrightness);
  }
}
