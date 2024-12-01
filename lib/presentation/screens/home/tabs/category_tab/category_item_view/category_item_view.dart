import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/styles/light_app_styles.dart';
import 'package:news_app/presentation/screens/home/tabs/category_tab/category_data_class/category_data_class.dart';

class CategoryItemView extends StatelessWidget {
  CategoryItemView({super.key, required this.categoryDM , required this.index});
  CategoryDM categoryDM;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(categoryDM.id),
      child: Container(
        decoration: BoxDecoration(
            color: categoryDM.color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
              bottomLeft: Radius.circular(index.isEven ?  25.r : 0.r),
              bottomRight: Radius.circular(index.isOdd ? 25.r : 0.r)
            )),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                categoryDM.imgPath,
                width: 132.w,
                height: 116.h,
              ),
              Text(
                categoryDM.title,
                style: LightAppStyles.titles,
              )
            ],
          ),
        ),
      ),
    );
  }
}
