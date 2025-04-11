import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manger/api_manger.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article>?articles;
  bool isLoading = false;
  String? errorMessage ;

  void getArticles(String sourceId) async {
    try{
      isLoading = true;
      notifyListeners();
      var response = await ApiManger.getArticles(sourceId);
      isLoading = false;
      if(response.status == 'ok'){
        articles = response.articles;
        notifyListeners();
      }else{
        errorMessage = response.message;
        notifyListeners();
      }

    }
    catch(e){
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}