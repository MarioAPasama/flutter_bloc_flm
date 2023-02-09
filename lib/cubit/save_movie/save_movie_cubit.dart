import 'dart:convert';

import 'package:application_flm/data/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'save_movie_state.dart';

class SaveMovieCubit extends Cubit<SaveMovieState> {
  SaveMovieCubit() : super(SaveMovieInitial());

  late SharedPreferences prefs;
  late List<MovieListModel> movieDetailModelSave = [];

  void initState() {
    initStateSharedPreferences();
  }

  void initStateSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    print('${prefs.getString('saveMovie')}');
    var result = jsonDecode(prefs.getString('saveMovie') ?? '[]');
    movieDetailModelSave = List<MovieListModel>.from(
        result.map((e) => MovieListModel.fromJson(e)));
  }

  void onTapSaveMovie(MovieListModel movieListModel) {
    bool isSave = movieDetailModelSave.contains(movieListModel);
    String saveMovieString = '';

    if (isSave) {
      movieDetailModelSave.remove(movieListModel);
    } else {
      movieDetailModelSave.add(movieListModel);

      for (var element in movieDetailModelSave) {
        saveMovieString += '${element.toJson()},';
      }
    }

    String result = ('[$saveMovieString]').replaceAll('},]', '}]');

    prefs.setString('saveMovie', result);

    print(prefs.getString('saveMovie'));

    chackMovieIsSave(movieListModel);
  }

  void chackMovieIsSave(MovieListModel movieListModel) {
    bool isSave = movieDetailModelSave.contains(movieListModel);
    emit(SaveMovie(isSave: isSave));
  }
}
