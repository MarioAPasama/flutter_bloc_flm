import 'package:application_flm/data/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/models.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final ScrollController scrollController = ScrollController();
  List<MovieListModel> movieListModel = [];
  late String idGenre;
  int page = 1;

  void initState() {
    clearData();
  }

  void clearData() {
    page = 1;
    movieListModel = [];
    emit(const ListCategoryLoaded(movieListModel: [], isLoaded: true));
  }

  Future<void> fecthListMovie() async {
    movieListModel += await MovieService.getListMovie(
        page: page.toString(), withGenres: idGenre);

    emit(ListCategoryLoaded(movieListModel: movieListModel, isLoaded: false));
  }

  Future<void> refreshIndicator() async {
    clearData();
    await fecthListMovie();
  }

  void onScroll() async {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      page++;
      await fecthListMovie();
    }
  }
}
