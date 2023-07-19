import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor_app/Features/home/business_logic/main_layout_cubit/main_layout_cubit.dart';
import 'package:labor_app/Features/home/presentation/widgets/main_layout_screen_body.dart';

class MainLayoutScreen extends StatelessWidget {
   MainLayoutScreen({super.key,required this.mainLayoutCubit});
  MainLayoutCubit mainLayoutCubit;
  @override
  Widget build(BuildContext context) {
return MainLayoutScreenBody(mainLayoutCubit: mainLayoutCubit,);
    
  }
}
