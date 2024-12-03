import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/styles/light_app_styles.dart';
import 'package:news_app/core/routes_manger.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';

class ArticlesItemView extends StatelessWidget {
  ArticlesItemView({super.key, required this.articles});

  Article articles;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, RoutesManger.articlesDetails,
            arguments: articles
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: articles.url ?? '',
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(articles.urlToImage ?? '')),
            ),
            SizedBox(height: 10.h,),
            Text(articles.source?.name ?? '' , style: LightAppStyles.sourceName,),
            SizedBox(height: 10.h,),
            Text(articles.description ?? '' , style: LightAppStyles.description,),
            SizedBox(height: 10.h,),
            Row(
              children: [const Spacer(), Text(articles.publishedAt ?? '' , style: LightAppStyles.publishedAt,)],
            )
          ],
        ),
      ),
    );
  }
}
