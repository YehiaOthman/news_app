import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/routes_manger.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';

class ArticlesItemView extends StatelessWidget {
  ArticlesItemView({super.key, required this.articles});

  Article articles;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, RoutesManger.articlesDetails),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(articles.urlToImage ?? '')),
            Text(articles.source?.name ?? ''),
            Text(articles.description ?? ''),
            Row(
              children: [const Spacer(), Text(articles.publishedAt ?? '')],
            )
          ],
        ),
      ),
    );
  }
}
