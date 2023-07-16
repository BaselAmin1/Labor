
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor_app/core/utils/assets.dart';

part 'select_local_state.dart';

class SelectLocalCubit extends Cubit<SelectLocalState> {
  SelectLocalCubit() : super(SelectLocalInitial());
  bool isEnglish = true;
  String suffixIconEnglish = Assets.imagesSelected;
  String suffixIconArabic = Assets.imagesNotSelect;
  void changeLocal(context) {
    isEnglish = !isEnglish;
    if (isEnglish) {
      suffixIconEnglish = Assets.imagesSelected;
      suffixIconArabic = Assets.imagesNotSelect;
      submitLocal(context);
    } else {
      suffixIconEnglish = Assets.imagesNotSelect;
      suffixIconArabic = Assets.imagesSelected;
      submitLocal(context);
    }
    emit(
      ChangeLocalState(),
    );
  }

  void submitLocal(context) {
    if (isEnglish) {
 EasyLocalization.of(context)!.setLocale(const Locale('en','UK'));
    } else {
       EasyLocalization.of(context)!.setLocale(const Locale('ar','EG'));
    }
    emit(
      SubmitLocalState(),
    );
  }
}
