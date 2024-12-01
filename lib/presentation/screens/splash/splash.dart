import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets_manger.dart';

import '../../../core/routes_manger.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RoutesManger.home);
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AssetsManger.splashPattern),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 10,),
          Image.asset(
            AssetsManger.splashLogo,
            width: 199.w,
            height: 208.h,
          ),
          const Spacer(flex: 5,),
          Image.asset(
            AssetsManger.routeLogo,
            width: 213.w,
            height: 128.h,
          ),
          const Spacer(flex: 1,)
        ],
      ),
    );
  }
}
