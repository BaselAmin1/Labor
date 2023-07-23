import 'package:flutter/material.dart';
import 'package:labor_app/Features/Splash/presentation/widgets/spalsh_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenbody(),
    );
  }
}
