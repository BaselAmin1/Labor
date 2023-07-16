import 'package:flutter/material.dart';
import 'package:labor_app/Features/Splash/presentation/screens/splash_screen.dart';
import 'package:labor_app/core/route/route_path.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    AppRouter();

    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
    return null;
  }
}
