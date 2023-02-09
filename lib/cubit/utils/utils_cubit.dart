import 'dart:developer';

import 'package:application_flm/data/models/models.dart';
import 'package:application_flm/data/services/services.dart';
import 'package:application_flm/infrastructure/theme/theme.dart';
import 'package:application_flm/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'utils_state.dart';

class UtilsCubit extends Cubit<UtilsState> {
  UtilsCubit() : super(UtilsInitial());

  late SharedPreferences prefs;
  late List<GenreListModel> genreListModel;

  TextEditingController searchTextEditingController = TextEditingController();

  bool? prefsIsDarkMode;
  List<ScreenHiddenDrawer> page = [
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'F L M',
          colorLineSelected: colorPrimary,
          baseStyle: const TextStyle(color: Colors.white),
          selectedStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const HomePage()),
  ];

  void initState() {
    fecthListGenre();
  }

  void fecthListGenre() async {
    genreListModel = await GenreService.getListGenre();

    emit(ListGenreLoaded(genreListModel: genreListModel));
  }

  void generateScreenHiddenDrawer() {
    for (int i = 0; i < genreListModel.length; i++) {
      page.add(
        ScreenHiddenDrawer(
            ItemHiddenMenu(
              name: genreListModel[i].name,
              colorLineSelected: colorPrimary,
              baseStyle: const TextStyle(color: Colors.white),
              selectedStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            CategoryPage(
              idGenre: genreListModel[i].id,
            )),
      );
    }
  }

  void urlLauncher(
      {required String url, required bool runExternalApplication}) async {
    await canLaunchUrlString(url)
        ? launchUrlString(url,
            mode: (runExternalApplication)
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault)
        : log('error');
  }

  void onTapSearch(bool isSarch) {
    if (!isSarch) {
      searchTextEditingController.text = '';
    }
    emit(IsSarch(isSarch: isSarch));
  }

  void onTapExit() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
