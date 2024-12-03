import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/styles/light_app_styles.dart';
import 'package:news_app/core/colors_manger.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';

class SourceTabItem extends StatelessWidget {
  SourceTabItem({super.key, required this.source, required this.isSelected});

  Source source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 8 , vertical: 5),
      margin: REdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: isSelected ? ColorsManger.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: ColorsManger.primary, width: 4)),
      child: Text(
        source.name ?? '',
        style: isSelected
            ? const TextStyle(fontSize: 18, color: Colors.white)
            : const TextStyle(fontSize: 18, color: ColorsManger.primary),
      ),
    );
  }
}
