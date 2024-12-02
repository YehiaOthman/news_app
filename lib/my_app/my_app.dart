import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/theme.dart';
import 'package:news_app/core/routes_manger.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/home.dart';
import 'package:news_app/presentation/screens/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.light,
        routes: {
          RoutesManger.splash: (_) => const Splash(),
          RoutesManger.home: (_) => const Home(),
        },
        initialRoute: RoutesManger.splash,
      ),
    );
  }
}
