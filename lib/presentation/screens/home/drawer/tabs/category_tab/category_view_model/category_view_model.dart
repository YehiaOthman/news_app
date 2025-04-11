import 'package:flutter/cupertino.dart';
import 'package:news_app/data/api/api_manger/api_manger.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';

class CategoryViewModel extends ChangeNotifier {
  List<Source>? sources;
  bool isLoading = false;
  String? errorMessage;

  // void getSourcesById(String categoryId) async {
  //   try{
  //     isLoading = true;
  //     notifyListeners();
  //     var response = await ApiManger.getSources(categoryId);
  //     isLoading = false;
  //     if(response.status == 'ok'){
  //       sources = response.sources;
  //       notifyListeners();
  //     }else{
  //       errorMessage = response.message;
  //       notifyListeners();
  //     }
  //   }
  //   catch(e){
  //     isLoading = false;
  //     errorMessage = e.toString();
  //     notifyListeners();
  //   }
  // }
  void getSourcesById(String categoryId) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      var response = await ApiManger.getSources(categoryId);

      if (response.status == 'ok') {
        sources = response.sources;
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}