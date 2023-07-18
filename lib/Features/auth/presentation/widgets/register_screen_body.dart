import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:labor_app/Features/auth/business_logic/register_cubit/register_cubit.dart';
import 'package:labor_app/Features/auth/business_logic/save_user_cubit/save_user_cubit.dart';
import 'package:labor_app/Features/auth/presentation/widgets/custom_social_login_button.dart';
import 'package:labor_app/core/route/route_path.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';
import 'package:labor_app/core/widgets/custom_button.dart';
import 'package:labor_app/core/widgets/custom_text_feild.dart';

class RegisterScreenBody extends StatefulWidget {
  RegisterScreenBody(
      {super.key, required this.registerCubit, required this.saveUserCubit});
  RegisterCubit registerCubit;
  SaveUserCubit saveUserCubit;

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final phoneController = TextEditingController();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          widget.saveUserCubit.saveUser(
              nameController.text, phoneController.text, emailController.text);
          Navigator.pushReplacementNamed(context, loginScreen);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Form(
              key: _registerKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height / 35),
                    Center(
                      child: Text(
                        'Register'.tr(),
                        style: Styles.textStyle28,
                      ),
                    ),
                    SizedBox(height: context.height / 60),
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
                      'FullName'.tr(),
                      style: Styles.textStyle16,
                    ),
                    SizedBox(height: context.height / 90),
                    CustomTextFeild(
                      label: 'EnterYourName'.tr(),
                      suffixIcon: FontAwesomeIcons.solidUser,
                      controller: nameController,
                    ),
                    SizedBox(height: context.height / 60),
                    Text(
                      'Phone'.tr(),
                      style: Styles.textStyle16,
                    ),
                    SizedBox(height: context.height / 90),
                    CustomTextFeild(
                      label: 'EnterYourPhone'.tr(),
                      suffixIcon: FontAwesomeIcons.phone,
                      keyboardType: TextInputType.number,
                      controller: phoneController,
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
                    SizedBox(height: context.height / 20),
                    SizedBox(
                      width: context.width / .5,
                      child: CustomButton(
                        onPressed: () {
                          widget.registerCubit.registerUser(
                            emailController.text,
                            passwordController.text,
                          );
                        },
                        text: 'Register'.tr(),
                      ),
                    ),
                    SizedBox(height: context.height / 90),
                    CUstomSocialLoginButton(
                      text: 'Facebook'.tr(),
                      icon: SvgPicture.asset(Assets.imagesFacebook),
                    ),
                    SizedBox(height: context.height / 90),
                    CUstomSocialLoginButton(
                      text: 'Google'.tr(),
                      icon: SvgPicture.asset(Assets.imagesGoogle),
                    ),
                    SizedBox(height: context.height / 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HaveAccount'.tr(),
                          style: Styles.textStyle16.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        const Text(
                          '  ',
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, loginScreen),
                          child: Text(
                            'Signin'.tr(),
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
