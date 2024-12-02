import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_data_class/category_data_class.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key , required this.categoryDM});
  CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(categoryDM.id),
    );
  }
}
