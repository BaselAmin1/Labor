import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:labor_app/core/route/route_path.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';
import 'package:labor_app/core/widgets/custom_button.dart';
import 'package:labor_app/core/widgets/custom_text_feild.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfffefcff),
          elevation: 0,
          leading: IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, loginScreen),
            icon: const Icon(FontAwesomeIcons.arrowLeft),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.height / 20),
              Center(
                child: Text(
                  'ForgetPassword'.tr(),
                  style: Styles.textStyle28,
                ),
              ),
              SizedBox(height: context.height / 30),
              Center(
                child: Text(
                  'EnteryourPhoneNumbertoresetpassword'.tr(),
                  textAlign: TextAlign.center,
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(height: context.height / 20),
              Text(
                'Phone'.tr(),
                style: Styles.textStyle16,
              ),
              SizedBox(height: context.height / 90),
              CustomTextFeild(
                label: 'EnterYourPhone'.tr(),
                suffixIcon: FontAwesomeIcons.phone,
              ),
              SizedBox(height: context.height / 20),
              SizedBox(
                width: context.width / .5,
                child: CustomButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, otpScreen),
                  text: 'ResetPassword'.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
