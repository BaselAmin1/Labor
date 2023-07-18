import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:labor_app/Features/auth/business_logic/login_cubit/login_cubit.dart';
import 'package:labor_app/Features/auth/presentation/widgets/custom_social_login_button.dart';
import 'package:labor_app/core/route/route_path.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';
import 'package:labor_app/core/widgets/custom_button.dart';
import 'package:labor_app/core/widgets/custom_text_feild.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key, required this.loginCubit});
  LoginCubit loginCubit;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, registerScreen);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Form(
              key: _loginKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height / 15),
                    Center(
                      child: Text(
                        'Login'.tr(),
                        style: Styles.textStyle28,
                      ),
                    ),
                    SizedBox(height: context.height / 30),
                    Center(
                      child: Text(
                        'PleaseEnteryourPhoneandpasswordtocontinue'.tr(),
                        textAlign: TextAlign.center,
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: context.height / 70),
                    Text(
                      'Email'.tr(),
                      style: Styles.textStyle16,
                    ),
                    SizedBox(height: context.height / 90),
                    CustomTextFeild(
                      label: 'EnterYourEmail'.tr(),
                      suffixIcon: FontAwesomeIcons.solidEnvelope,
                      controller: emailController,
                    ),
                    SizedBox(height: context.height / 60),
                    Text(
                      'Password'.tr(),
                      style: Styles.textStyle16,
                    ),
                    SizedBox(height: context.height / 90),
                    CustomTextFeild(
                      label: 'EnterYourPassword'.tr(),
                      suffixIcon: FontAwesomeIcons.solidEye,
                      controller: passwordController,
                    ),
                    SizedBox(height: context.height / 90),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, forgetPasswordScreen),
                          child: Text(
                            'ForgetPassword?'.tr(),
                            style: Styles.textStyle16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.height / 40),
                    SizedBox(
                      width: context.width / .5,
                      child: CustomButton(
                        text: 'Login'.tr(),
                        onPressed: () {
                          loginCubit.loginUser(
                              emailController.text, passwordController.text);
                        },
                      ),
                    ),
                    SizedBox(height: context.height / 40),
                    Center(
                      child: Text(
                        'OR'.tr(),
                        style: Styles.textStyle16,
                      ),
                    ),
                    SizedBox(height: context.height / 40),
                    CUstomSocialLoginButton(
                      text: 'Facebook'.tr(),
                      icon: SvgPicture.asset(Assets.imagesFacebook),
                    ),
                    SizedBox(height: context.height / 40),
                    CUstomSocialLoginButton(
                      text: 'Google'.tr(),
                      icon: SvgPicture.asset(Assets.imagesGoogle),
                    ),
                    SizedBox(height: context.height / 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DontHaveAccount'.tr(),
                          style: Styles.textStyle16.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        const Text(
                          '  ',
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, registerScreen),
                          child: Text(
                            'SignUp'.tr(),
                            style: Styles.textStyle16.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
