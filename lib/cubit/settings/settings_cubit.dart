import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  void initState() {
    appVersion();
  }

  void appVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final AppVersion updateState = AppVersion(appVersion: packageInfo.version);
    emit(updateState);
  }
}
