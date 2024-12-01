import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manger.dart';

class LightAppStyles{
  static  TextStyle titles = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static  TextStyle homeTitle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManger.homeCategories,
  );
  static  TextStyle drawerTitle = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}