import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor_app/Features/home/business_logic/main_layout_cubit/main_layout_cubit.dart';

class MainLayoutScreenBody extends StatelessWidget {
  MainLayoutScreenBody({super.key, required this.mainLayoutCubit});
  MainLayoutCubit mainLayoutCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit, MainLayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: mainLayoutCubit.screens[mainLayoutCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state is AppBottomNavState ? state.currentIndex : 0,
              onTap: (index) {
                mainLayoutCubit.changeBottomNavBar(index);
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              items: mainLayoutCubit.bottomItems,
            ),
          ),
        );
      },
    );
  }
}
