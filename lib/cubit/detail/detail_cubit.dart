import 'package:application_flm/data/models/models.dart';
import 'package:application_flm/data/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());

  void initState() {
    clearData();
  }

  void clearData() {
    MovieDetailModel movieDetailModel = const MovieDetailModel(
        id: 'id',
        homepage: 'homepage',
        originalTitle: 'originalTitle',
        genres: [],
        originalLanguage: 'originalLanguage',
        releaseDate: 'releaseDate',
        overview: 'overview',
        backdropPath: 'backdropPath',
        voteAverage: 0);

    emit(ListDetailMovieLoaded(
        movieDetailModel: movieDetailModel,
        creditListModel: const [],
        isLoaded: true));
  }

  Future<void> fecthDetailMovie(String idMovie) async {
    MovieDetailModel movieDetailModel =
        await MovieService.getDetailMovie(idMovie: idMovie);

    List<CreditListModel> creditListModel =
        await CreditService.getListCredit(idMovie: idMovie);

    emit(ListDetailMovieLoaded(
        movieDetailModel: movieDetailModel,
        creditListModel: creditListModel,
        isLoaded: false));
  }

  Future<void> refreshIndicator(String idMovie) async {
    clearData();
    await fecthDetailMovie(idMovie);
  }
}
