import 'package:flutter/material.dart';
import 'package:labor_app/Features/auth/business_logic/register_cubit/register_cubit.dart';
import 'package:labor_app/Features/auth/business_logic/save_user_cubit/save_user_cubit.dart';
import 'package:labor_app/Features/auth/presentation/widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key,required this.registerCubit,required this.saveUserCubit});
RegisterCubit registerCubit;
SaveUserCubit saveUserCubit;
  @override
  Widget build(BuildContext context) {
    return  RegisterScreenBody(registerCubit:registerCubit,saveUserCubit: saveUserCubit,);
  }
}