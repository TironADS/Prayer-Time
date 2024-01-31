import 'dart:convert';

import 'package:http/http.dart';

import '../../Model_Class/PrayerModel.dart';
import '../api_client.dart';

class PrayerApi {
  ApiClient apiClient = ApiClient();

  Future<PrayerModel> getPrayer({required String location}) async {
    String path = 'https://muslimsalat.p.rapidapi.com/${location}.json';
    var body = {};
    Response response = await apiClient.invokeAPI(path, 'GET', body);
    return PrayerModel.fromJson(jsonDecode(response.body));
  }
}
