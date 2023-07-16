import 'package:flutter/material.dart';
import 'package:labor_app/Features/select_local/business_logic/select_local_cubit/select_local_cubit.dart';
import 'package:labor_app/Features/select_local/presentation/widgets/select_local_screen_body.dart';

class SelectLocalScreen extends StatelessWidget {
   SelectLocalScreen({super.key,required this.selectLocalCubit});
 SelectLocalCubit selectLocalCubit;

  @override
  Widget build(BuildContext context) {
    return  SelectLocalScreenBody(selectLocalCubit: selectLocalCubit,);
  }
}