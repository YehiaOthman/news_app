import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/styles/light_app_styles.dart';
import '../../../../core/colors_manger.dart';
import '../../../../core/strings_manger.dart';

Widget buildDrawer(
    context, VoidCallback categoryTab, VoidCallback settingsTab) {
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.7.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: ColorsManger.primary,
          height: MediaQuery.of(context).size.height * 0.2.h,
          child: Center(
              child: Text(
            StringsManger.drawerTitle,
            style: LightAppStyles.drawerTitle,
          )),
        ),
        InkWell(
            onTap: () {
              categoryTab();
              Navigator.pop(context);
            },
            child: buildDrawerTabs(Icons.list, 'Categories')),
        InkWell(
            onTap: () {
              settingsTab();
              Navigator.pop(context);
            },
            child: buildDrawerTabs(Icons.settings, 'Settings')),
      ],
    ),
  );
}

Widget buildDrawerTabs(IconData icon, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Icon(
          icon,
          size: 30.sp,
          color: Colors.black,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          title,
          style: LightAppStyles.homeTitle.copyWith(color: Colors.black),
        )
      ],
    ),
  );
}
