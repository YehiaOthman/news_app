import 'package:flutter/material.dart';
import 'package:news_app/core/colors_manger.dart';
import 'package:news_app/data/api/api_manger/api_manger.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/api/model/articles_response/articles_response.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_details/articles_item_widget/articles_item_view/articles_item_view.dart';

class SearchScreen extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsManger.primary,
      ),
      inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white,
          )),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.searchEngin(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        var articlesResponse = snapshot.data as ArticlesResponse;
        if (articlesResponse.articles == null ||
            articlesResponse.articles!.isEmpty) {
          return const Center(child: Text('Not Found'));
        }
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticlesItemView(articles: articlesResponse.articles![index]),
            itemCount: articlesResponse.articles!.length ?? 0,
          ),
        );
      },
    );
  }
}
