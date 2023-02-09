part of 'services.dart';

class GenreService {
  static Future<List<GenreListModel>> getListGenre() async {
    Map<String, String> body = {
      'api_key': MainService().apiKey,
    };

    final result =
        await MainService().apiGet(url: 'genre/movie/list', body: body);

    return List<GenreListModel>.from(
        result['genres'].map((e) => GenreListModel.fromJson(e)));
  }
}
