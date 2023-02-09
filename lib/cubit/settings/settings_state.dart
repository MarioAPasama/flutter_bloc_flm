part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class AppVersion extends SettingsState {
  final String appVersion;
  const AppVersion({required this.appVersion});

  @override
  List<Object> get props => [appVersion];
}

class SettingsInitial extends SettingsState {}
