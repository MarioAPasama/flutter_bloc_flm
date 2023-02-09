part of 'services.dart';

class MainService {
  String apiKey = '<apiKey>';
  String urlAPIVersion = '3';
  late String urlAPIMain = 'https://api.themoviedb.org/$urlAPIVersion/';
  String imageRestW300 = 'w300';
  String imageRestW780 = 'w780';
  String imageRestW1280 = 'w1280';
  String imageRestOriginal = 'original';
  late String imageBaseUrl = 'https://image.tmdb.org/t/p/';

  Future<dynamic> apiGet(
      {required String url,
      Map<String, dynamic>? body,
      http.Client? client}) async {
    String queryString = Uri(queryParameters: body).query;
    String apiHttp = '$urlAPIMain$url?$queryString';
    client ??= http.Client();

    try {
      final response = await http
          .get(Uri.parse(apiHttp))
          .timeout(const Duration(seconds: 50));

      log('Url:$apiHttp\nBody\n$body\n${response.body}');

      if (response.statusCode != 200) {
        // apiErrorHendlerExtension(messaseError: result['message']);
        return;
      }

      final result = jsonDecode(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
