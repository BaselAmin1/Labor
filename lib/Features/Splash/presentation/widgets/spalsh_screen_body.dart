import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor_app/constants.dart';
import 'package:labor_app/core/route/route_path.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:labor_app/core/utils/cache_helper.dart';

class SplashScreenbody extends StatefulWidget {
  const SplashScreenbody({super.key});

  @override
  State<SplashScreenbody> createState() => _SplashScreenbodyState();
}

class _SplashScreenbodyState extends State<SplashScreenbody> {
  @override
  void initState() {
    super.initState();
    navigateToHome(context);
  }
  bool isOnBoarding = CacheHelper.getData(key: 'onBoarding') ?? true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset(Assets.imagesLogo)),
          ],
        ),
      ),
    );
  }

  void navigateToHome(context) {
    Future.delayed(const Duration(seconds: 3), () {
      isOnBoarding?
      Navigator.pushReplacementNamed(context, selectLocalScreen):Navigator.pushReplacementNamed(context, loginScreen);
    });
  }
}
