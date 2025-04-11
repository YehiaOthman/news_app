import 'package:flutter/material.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:provider/provider.dart';

import 'articles_item_view/articles_item_view.dart';
import 'articles_view_model/articles_view_model.dart';

class ArticlesItemWidget extends StatefulWidget {
  ArticlesItemWidget({super.key, required this.sources});

  Source sources;

  @override
  State<ArticlesItemWidget> createState() => _ArticlesItemWidgetState();
}


class _ArticlesItemWidgetState extends State<ArticlesItemWidget> {
  var viewModel = ArticlesViewModel();
  @override
  void initState() {
    viewModel.getArticles(widget.sources.id ?? '');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    viewModel.getArticles(widget.sources.id ?? '');
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(builder: (context, value, child) {
        if(viewModel.isLoading) return const Center(child: CircularProgressIndicator(),);
        if(viewModel.errorMessage!=null) return const Text('check Network Connection');
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticlesItemView(articles: value.articles![index]),
            itemCount: value.articles!.length,
          ),
        );
      }),
    );

    //   FutureBuilder(
    //   future: ApiManger.getArticles(widget.sources.id ?? ''),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator(),);
    //     }
    //     if (snapshot.data?.status == 'error' || snapshot.hasError) {
    //       return const Text('Check Network Connection');
    //     }
    //     List<Article> articles = snapshot.data?.articles ?? [];
    //     return Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (context, index) =>
    //             ArticlesItemView(articles: articles[index]),
    //         itemCount: articles.length,
    //       ),
    //     );
    //   },
    // );
  }
}
