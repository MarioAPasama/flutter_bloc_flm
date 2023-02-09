part of 'dark_mode_cubit.dart';

abstract class DarkModeState extends Equatable {
  const DarkModeState();

  @override
  List<Object> get props => [];
}

class ThemeBrightness extends DarkModeState {
  final bool isDrakMode;
  final ThemeMode themeMode;
  const ThemeBrightness({required this.isDrakMode, required this.themeMode});

  @override
  List<Object> get props => [isDrakMode, themeMode];
}

class DarkModeInitial extends DarkModeState {}
