import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor_app/Features/select_local/business_logic/select_local_cubit/select_local_cubit.dart';
import 'package:labor_app/constants.dart';
import 'package:labor_app/core/route/route_path.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:labor_app/core/utils/styles.dart';
import 'package:labor_app/core/widgets/custom_button.dart';

class SelectLocalScreenBody extends StatelessWidget {
   SelectLocalScreenBody({super.key,required this.selectLocalCubit});
 SelectLocalCubit selectLocalCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectLocalCubit, SelectLocalState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 130.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.r),
                      color: kPrimaryColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0.h),
                      child: SvgPicture.asset(
                        Assets.imagesLogo,
                      ), 
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Findyourhomeservice'.tr(),
                    style: Styles.textStyle36.copyWith(height: 1),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text('selectlanguage'.tr(), style: Styles.textStyle20),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () => selectLocalCubit.changeLocal(context),
                    child: Row(
                      children: [
                        Text('English'.tr(), style: Styles.textStyle16),
                        const Spacer(),
                        SvgPicture.asset(selectLocalCubit.suffixIconEnglish),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 320.w,
                    height: .5.h,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () => selectLocalCubit.changeLocal(context),
                    child: Row(
                      children: [
                        Text('Arabic'.tr(), style: Styles.textStyle16),
                        const Spacer(),
                        SvgPicture.asset(selectLocalCubit.suffixIconArabic),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 320.w,
                    height: .5.h,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text:'Bycreatinganaccountyouagreetoour'.tr(),
                            style:
                                Styles.textStyle12.copyWith(color: Colors.grey),
                            children: [
                              const TextSpan(text: '  '),
                              TextSpan(
                                text: 'TermandConditions'.tr(),
                                style: Styles.textStyle12
                                    .copyWith(color: kPrimaryColor),
                                onEnter: (event) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 350.w,
                    child: CustomButton(
                     onPressed: () => Navigator.pushReplacementNamed(context, boardingScreen),
                      text:'Enter'.tr(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
