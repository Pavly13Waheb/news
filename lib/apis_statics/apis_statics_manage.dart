import 'package:http/http.dart' as http;
import 'dart:convert';
import '../sourceResponse.dart';

class ApisStaticsManager {
  static String apiNewsKey = "b853c02d81734c639dc77ed6705129e2";
  static String apiNewsBaseUrl = "newsapi.org";
  static String apiNewsSourcesUrl = "v2/top-headlines/sources";

  static Future<SourceResponseDM> getSources() async {
    Uri url = Uri.https(
        ApisStaticsManager.apiNewsBaseUrl,
        ApisStaticsManager.apiNewsSourcesUrl,
        {"apiKey": ApisStaticsManager.apiNewsKey});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body);
    SourceResponseDM sourceResponse = SourceResponseDM.fromJson(json);
    return sourceResponse;
  }

  getArticle() {}
}
