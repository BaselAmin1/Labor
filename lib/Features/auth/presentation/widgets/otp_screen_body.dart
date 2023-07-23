import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:labor_app/Features/auth/presentation/widgets/custom_otp.dart';
import 'package:labor_app/core/route/route_path.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';
import 'package:labor_app/core/widgets/custom_button.dart';

class OTPScreenBody extends StatelessWidget {
    OTPScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffefcff),
        elevation: 0,
        leading: IconButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, registerScreen),
          icon: const Icon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: context.height / 15),
            Center(
              child: Text(
                'Otp'.tr(),
                style: Styles.textStyle28,
              ),
            ),
             SizedBox(height: context.height / 30),
            Center(
              child: Text(
                'AnAuthentecationcodehasbeensentto'.tr(),
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
            ),
            Center(
              child: Text(
                '(+02) 01003625286',
                style: Styles.textStyle14.copyWith(
                  color: const Color(0xffF5DF99),
                ),
              ),
            ),
            SizedBox(height: context.height / 20),
            CustomOTP(),
            SizedBox(height: context.height / 20),
            SizedBox(
              width: context.width / .5,
              child: CustomButton(
                text: 'Submit'.tr(),
                onPressed: (){

                },
              ),
            ),
            SizedBox(height: context.height / 40),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'CodeSent'.tr(),
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                        children: [
                          const TextSpan(text: '  '),
                          TextSpan(
                            text: '00:50',
                            style: Styles.textStyle14
                                .copyWith(color: const Color(0xffF5DF99)),
                            onEnter: (event) {
                      
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
