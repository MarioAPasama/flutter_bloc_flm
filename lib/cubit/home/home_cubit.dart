import 'package:application_flm/data/models/models.dart';
import 'package:application_flm/data/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ScrollController scrollController = ScrollController();
  List<MovieListModel> movieListModel = [];
  int page = 1;
  late String onScrollSearchQuery = '';

  void initState() {
    fecthListMovie();
  }

  Future<void> fecthListMovie() async {
    await MovieService.getListMovie(page: page.toString()).then((value) {
      movieListModel += value;
      emit(ListMovieLoaded(movieListModel: movieListModel, isLoaded: false));
    });
  }

  Future<void> refreshIndicator() async {
    clearData();
    await fecthListMovie();
  }

  Future<void> searchListMovie() async {
    await MovieService.getListMovieSearch(
            page: page.toString(), query: onScrollSearchQuery)
        .then((value) {
      movieListModel += value;
      emit(ListMovieLoaded(movieListModel: movieListModel, isLoaded: false));
    });
  }

  void onScroll() async {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      page++;
      if (onScrollSearchQuery == '') {
        await fecthListMovie();
      } else {
        await searchListMovie();
      }
    }
  }

  void clearData() {
    page = 1;
    movieListModel = [];
    onScrollSearchQuery = '';
    emit(const ListMovieLoaded(movieListModel: [], isLoaded: true));
  }
}
