part of 'services.dart';

class MovieService {
  static Future<List<MovieListModel>> getListMovie(
      {required String page, String? withGenres}) async {
    Map<String, String> body = {
      'api_key': MainService().apiKey,
      'sort_by': 'popularity.desc',
      'release_date.gte': DateTime.now().toString().split(' ').first,
      'with_genres': withGenres ?? '',
      'page': page,
    };

    final result =
        await MainService().apiGet(url: 'discover/movie', body: body);

    return List<MovieListModel>.from(
        result['results'].map((e) => MovieListModel.fromJson(e)));
  }

  static Future<MovieDetailModel> getDetailMovie(
      {required String idMovie}) async {
    Map<String, String> body = {
      'api_key': MainService().apiKey,
    };

    final result =
        await MainService().apiGet(url: 'movie/$idMovie', body: body);

    return MovieDetailModel.fromJson(result);
  }

  static Future<List<MovieListModel>> getListMovieSearch(
      {required String page, required String query}) async {
    Map<String, String> body = {
      'api_key': MainService().apiKey,
      'query': query,
      'page': page,
    };

    final result = await MainService().apiGet(url: 'search/movie', body: body);

    return List<MovieListModel>.from(
        result['results'].map((e) => MovieListModel.fromJson(e)));
  }
}
