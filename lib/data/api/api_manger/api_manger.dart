import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/api/model/sources_response/sources_response.dart';

import '../model/articles_response/articles_response.dart';
class ApiManger{
  static const String baseUrl = 'newsapi.org';
  static const String apiKey ='c099d7756bf34054bc296b1cf834a79e';
  static const String endPoint ='/v2/top-headlines/sources';

  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri uri = Uri.http(baseUrl,endPoint,{
      'apiKey':apiKey,
      'category':categoryId
    });
    var response = await http.get(uri);
    String bodyString = response.body;
    var json  = jsonDecode(bodyString);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
  static Future<ArticlesResponse> getArticles(String query) async {
    Uri uri = Uri.https(
      "newsapi.org",
      "/v2/everything",
      {
        'q': query,
        'apiKey': 'c099d7756bf34054bc296b1cf834a79e',
      },
    );

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      String bodyString = response.body;
      var json = jsonDecode(bodyString);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      return articlesResponse;
    } else {
      throw Exception('Failed to load articles: ${response.statusCode}');
    }
  }

}