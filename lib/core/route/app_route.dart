import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor_app/Features/Splash/presentation/screens/splash_screen.dart';
import 'package:labor_app/Features/auth/presentation/screens/forget_password_screen.dart';
import 'package:labor_app/Features/auth/presentation/screens/login_screen.dart';
import 'package:labor_app/Features/auth/presentation/screens/otp_screen.dart';
import 'package:labor_app/Features/auth/presentation/screens/register_screen.dart';
import 'package:labor_app/Features/boarding/presentation/screens/boarding_screen.dart';
import 'package:labor_app/Features/select_local/business_logic/select_local_cubit/select_local_cubit.dart';
import 'package:labor_app/Features/select_local/presentation/screens/select_local_screen.dart';
import 'package:labor_app/core/route/route_path.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    SelectLocalCubit selectLocalCubit = SelectLocalCubit();

    AppRouter();

    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case selectLocalScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SelectLocalCubit>.value(
            value: selectLocalCubit,
            child: SelectLocalScreen(
              selectLocalCubit: selectLocalCubit,
            ),
          ),
        );
      case boardingScreen:
        return MaterialPageRoute(
          builder: (_) => const BoardingScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OTPScreen(),
        );
      case forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
    }
    return null;
  }
}
