import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/screens/home/tabs/category_tab/category_data_class/category_data_class.dart';
import 'package:news_app/presentation/screens/home/tabs/category_tab/category_item_view/category_item_view.dart';
import '../../../../../config/styles/light_app_styles.dart';
import '../../../../../core/strings_manger.dart';

class CategoryTab extends StatelessWidget {
  CategoryTab({super.key});

  List<CategoryDM> categories = CategoryDM.categoryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 12 , left: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            StringsManger.homeCategories,
            style: LightAppStyles.homeTitle,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => Padding(
              padding: REdgeInsets.all(12),
              child:
                  CategoryItemView(categoryDM: categories[index], index: index),
            ),
            itemCount: categories.length,
          ))
        ],
      ),
    );
  }
}
