import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manger/api_manger.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';

import 'articles_item_view/articles_item_view.dart';


class ArticlesItemWidget extends StatelessWidget {
  ArticlesItemWidget({super.key, required this.sources});

  Source sources;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getArticles(sources.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return const Text('Check Network Connection');
        }
        List<Article> articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticlesItemView(articles: articles[index]),
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}
