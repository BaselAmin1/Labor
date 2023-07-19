import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:labor_app/demo_screen.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: const Icon(
        FontAwesomeIcons.houseChimney,
        //  color: Colors.black,
      ),
      label: 'Home'.tr(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        FontAwesomeIcons.solidRectangleList,
        // color: Colors.black,
      ),
      label: 'History'.tr(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        FontAwesomeIcons.borderAll,
        // color: Colors.black,
      ),
      label: 'Categories'.tr(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        FontAwesomeIcons.solidUser,
        //color: Colors.black,
      ),
      label: 'Profile'.tr(),
    ),
  ];

  void ChangeBottomNavBar(index) {
    currentIndex = index;
    emit(AppBottomNavState(currentIndex));
  }

  List<Widget> Screens = [
    const DemoScreen(),
    const DemoScreen(),
    const DemoScreen(),
    const DemoScreen(),
  ];
}
