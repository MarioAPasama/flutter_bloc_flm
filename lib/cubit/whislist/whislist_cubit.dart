import 'dart:convert';

import 'package:application_flm/data/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'whislist_state.dart';

class WhislistCubit extends Cubit<WhislistState> {
  WhislistCubit() : super(WhislistInitial());

  late SharedPreferences prefs;

  late List<MovieListModel> movieWhislistModelSave = [];

  void initState() {
    initStateSharedPreferences();
  }

  void initStateSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    var result = jsonDecode(prefs.getString('saveMovie') ?? '[]');
    movieWhislistModelSave = List<MovieListModel>.from(
        result.map((e) => MovieListModel.fromJson(e)));
    fecthListWhislistMovie();
  }

  fecthListWhislistMovie() {
    emit(ListMovieWhislistLoaded(
        movieListModel: movieWhislistModelSave, isLoaded: false));
  }
}
