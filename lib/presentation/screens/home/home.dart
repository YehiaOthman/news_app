import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/styles/light_app_styles.dart';
import 'package:news_app/core/assets_manger.dart';
import 'package:news_app/core/strings_manger.dart';
import 'package:news_app/presentation/screens/home/tabs/category_tab/category_tab.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'drawer/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [
     CategoryTab(),
    const SettingsTab(),
  ];
  int currentTab = 0;
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
      drawer: buildDrawer(context ,selectCategory ,selectSettings) ,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManger.splashPattern))
        ),
          child: tabs[currentTab]),
    );
  }
  void selectCategory(){
    setState(() {
      currentTab = 0;
    });
  }
  void selectSettings(){
    setState(() {
      currentTab = 1;
    });
  }

}
