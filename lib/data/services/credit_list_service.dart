part of 'services.dart';

class CreditService {
  static Future<List<CreditListModel>> getListCredit(
      {required String idMovie}) async {
    Map<String, String> body = {
      'api_key': MainService().apiKey,
    };

    final result =
        await MainService().apiGet(url: 'movie/$idMovie/credits', body: body);

    return List<CreditListModel>.from(
        result['cast'].map((e) => CreditListModel.fromJson(e)));
  }
}
