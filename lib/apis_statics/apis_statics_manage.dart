import 'package:http/http.dart';
import 'dart:convert';
import 'ArticlesResponseDM.dart';
import 'sourceResponse.dart';

class ApisStaticsManager {
  static String apiNewsKey = "b853c02d81734c639dc77ed6705129e2";
  static String apiNewsBaseUrl = "newsapi.org";
  static String apiNewsSourcesUrl = "v2/top-headlines/sources";

  static Future<SourceResponseDM> getSources(String categoryId) async {
    Uri url =
        Uri.https(apiNewsBaseUrl, apiNewsSourcesUrl, {"apiKey": apiNewsKey,"category" : categoryId});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    SourceResponseDM sourceResponse = SourceResponseDM.fromJson(json);
    if (sourceResponse.message != null) {
      throw Exception(sourceResponse.message);
    }
    return sourceResponse;
  }

  static Future<ArticlesResponseDM> getArticle(String sourceId) async {
    Uri url = Uri.https(apiNewsBaseUrl, "v2/everything",
        {"sources": sourceId, "apiKey": apiNewsKey,
           });
    Response response = await get(url);
    
    ArticlesResponseDM articlesResponseDM =
        ArticlesResponseDM.fromJson(jsonDecode(response.body));
    if (articlesResponseDM.code != null) {
      throw Exception(articlesResponseDM.code);
    }
    return articlesResponseDM;
  }
}
