import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors_manger.dart';

class MyTheme{
  static final ThemeData light = ThemeData(
    appBarTheme:  AppBarTheme(
      backgroundColor: ColorsManger.primary,
      shape:  ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(150.r))
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 40.sp,
      ),
    )
  );
}