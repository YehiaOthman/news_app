import 'dart:ui';

import 'package:news_app/core/assets_manger.dart';
import 'package:news_app/core/colors_manger.dart';
import 'package:news_app/core/constant_manger.dart';
import 'package:news_app/core/strings_manger.dart';

class CategoryDM {
  String id;
  String title;
  String imgPath;
  Color color;

  CategoryDM({
    required this.id,
    required this.title,
    required this.color,
    required this.imgPath,
  });

 static List<CategoryDM> categoryList = [
    CategoryDM(
        id: ConstantManger.businessId,
        title: StringsManger.businessCategory,
        color: ColorsManger.business,
        imgPath: AssetsManger.businessIcon),
    CategoryDM(
        id: ConstantManger.entertainmentId,
        title: StringsManger.entertainmentCategory,
        color: ColorsManger.entertainment,
        imgPath: AssetsManger.entertainmentIcon),
    CategoryDM(
        id: ConstantManger.generalId,
        title: StringsManger.general,
        color: ColorsManger.general,
        imgPath: AssetsManger.generalIcon),
    CategoryDM(
        id: ConstantManger.healthId,
        title: StringsManger.healthCategory,
        color: ColorsManger.health,
        imgPath: AssetsManger.healthIcon),
    CategoryDM(
        id: ConstantManger.scienceId,
        title: StringsManger.scienceCategory,
        color: ColorsManger.science,
        imgPath: AssetsManger.scienceIcon),
    CategoryDM(
        id: ConstantManger.sportsId,
        title: StringsManger.sportCategory,
        color: ColorsManger.sports,
        imgPath: AssetsManger.sportsIcon),
    CategoryDM(
        id: ConstantManger.technologyId,
        title: StringsManger.technology,
        color: ColorsManger.technology,
        imgPath: AssetsManger.technologyIcon),
  ];
}
