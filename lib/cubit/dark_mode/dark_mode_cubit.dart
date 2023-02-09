import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dark_mode_state.dart';

class DarkModeCubit extends Cubit<DarkModeState> {
  DarkModeCubit() : super(DarkModeInitial());

  late SharedPreferences prefs;
  bool? prefsIsDarkMode;

  void initState() {
    initStateSharedPreferences();
  }

  void initStateSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    prefsIsDarkMode = prefs.getBool('prefsIsDarkMode');
  }

  void changeBrightnessMode(BuildContext context, {required bool value}) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    if (state is ThemeBrightness) {
      final ThemeBrightness updateState = ThemeBrightness(
          isDrakMode: value,
          themeMode: (value) ? ThemeMode.dark : ThemeMode.light);

      emit(updateState);
    } else {
      emit(ThemeBrightness(
          isDrakMode: (prefsIsDarkMode == null) ? isDarkMode : value,
          themeMode: prefsIsDarkMode == null
              ? ThemeMode.system
              : (value ? ThemeMode.dark : ThemeMode.light)));
    }
    prefs.setBool(
        'prefsIsDarkMode', (prefsIsDarkMode == null) ? isDarkMode : value);
    prefsIsDarkMode = prefs.getBool('prefsIsDarkMode');
    log('prefsIsDarkMode ${prefs.getBool('prefsIsDarkMode')}');
  }

  Future<void> initBrightnessMode(BuildContext context) async {
    Future.delayed(const Duration(seconds: 2), () {
      changeBrightnessMode(context, value: prefsIsDarkMode ?? false);
    });
  }
}
