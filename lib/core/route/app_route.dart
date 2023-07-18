import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor_app/Features/Splash/presentation/screens/splash_screen.dart';
import 'package:labor_app/Features/auth/business_logic/login_cubit/login_cubit.dart';
import 'package:labor_app/Features/auth/business_logic/register_cubit/register_cubit.dart';
import 'package:labor_app/Features/auth/business_logic/save_user_cubit/save_user_cubit.dart';
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
    RegisterCubit registerCubit = RegisterCubit();
    SaveUserCubit saveUserCubit = SaveUserCubit();
    LoginCubit loginCubit = LoginCubit();

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
          builder: (_) => BlocProvider<LoginCubit>.value(
            value: loginCubit,
            child: LoginScreen(loginCubit: loginCubit,),
          ),
        );
      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<RegisterCubit>.value(
                value: registerCubit,
              ),
              BlocProvider<SaveUserCubit>.value(
                value: saveUserCubit,
              ),
            ],
            child: RegisterScreen(
              registerCubit: registerCubit,
              saveUserCubit: saveUserCubit,
            ),
          ),
        );
      case otpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterCubit>.value(
            value: registerCubit,
            child: OTPScreen(),
          ),
        );
      case forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterCubit>.value(
            value: registerCubit,
            child: ForgetPasswordScreen(),
          ),
        );
    }
    return null;
  }
}
