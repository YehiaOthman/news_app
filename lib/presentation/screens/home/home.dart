import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/styles/light_app_styles.dart';
import 'package:news_app/core/assets_manger.dart';
import 'package:news_app/core/strings_manger.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_data_class/category_data_class.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_details/category_details.dart';
import 'drawer/drawer.dart';
import 'drawer/tabs/category_tab/category_tab.dart';
import 'drawer/tabs/settings_tab/settings_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoryTab(onCategoryClicked: onClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
                onTap: () => print('search'), child: const Icon(Icons.search)),
          )
        ],
        bottom:
            PreferredSize(preferredSize: Size(412.w, 15.h), child: Container()),
        title: Text(
          StringsManger.homeTitle,
          style: LightAppStyles.titles,
        ),
      ),
      drawer: buildDrawer(context, selectCategory, selectSettings),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsManger.splashPattern))),
          child: selectedWidget),
    );
  }

  void selectCategory() {
    setState(() {
      selectedWidget = CategoryTab(onCategoryClicked: onClicked);
    });
  }

  void selectSettings() {
    setState(() {
      selectedWidget = const SettingsTab();
    });
  }

  void onClicked(CategoryDM category) {
    setState(() {
      selectedWidget = CategoryDetails(categoryDM: category);
    });
  }
}
