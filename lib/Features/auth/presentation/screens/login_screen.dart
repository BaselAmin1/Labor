import 'package:flutter/material.dart';
import 'package:labor_app/Features/auth/business_logic/login_cubit/login_cubit.dart';
import 'package:labor_app/Features/auth/presentation/widgets/login_screen_body.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key,required this.loginCubit});
    LoginCubit loginCubit ;

  @override
  Widget build(BuildContext context) {
    return LoginScreenBody(loginCubit: loginCubit,);
  }
}
