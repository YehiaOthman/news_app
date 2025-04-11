import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_data_class/category_data_class.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_details/tab_bar_widget/tab_bar_widget.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_view_model/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSourcesById(widget.categoryDM.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<CategoryViewModel>(builder: (context, value, child) {
        if(viewModel.isLoading) return const Center(child: CircularProgressIndicator(),);
        if(viewModel.errorMessage!=null) return const Center(child: Text('Check Network Connection'),);
        return SourcesTabWidget(sources: viewModel.sources!);
      },),
    );

  }
}


//   FutureBuilder(
//   future: ApiManger.getSources(categoryDM.id),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     if (snapshot.hasError) return Text(snapshot.error.toString());
//     List<Source> sourcesList = snapshot.data?.sources ?? [];
//     return SourcesTabWidget(sources: sourcesList);
//   },
// );
