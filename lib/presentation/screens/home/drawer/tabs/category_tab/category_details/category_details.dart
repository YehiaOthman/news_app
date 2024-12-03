import 'package:flutter/material.dart';
import 'package:news_app/core/assets_manger.dart';
import 'package:news_app/data/api/api_manger/api_manger.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_data_class/category_data_class.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_details/tab_bar_widget/tab_bar_widget.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getSources(categoryDM.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) return Text(snapshot.error.toString());
        List<Source> sourcesList = snapshot.data?.sources ?? [];
        return SourcesTabWidget(sources: sourcesList);
      },
    );
  }
}
