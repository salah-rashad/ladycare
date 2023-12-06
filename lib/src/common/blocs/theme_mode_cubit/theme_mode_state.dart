part of 'theme_mode_cubit.dart';

class ThemeModeState extends Equatable {
  final ThemeMode mode;
  const ThemeModeState({required this.mode});

  @override
  List<Object> get props => [mode];
}

final class ThemeModeInitial extends ThemeModeState {
  const ThemeModeInitial() : super(mode: ThemeMode.system);
}
