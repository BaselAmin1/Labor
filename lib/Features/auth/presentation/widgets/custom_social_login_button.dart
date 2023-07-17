import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';

class CUstomSocialLoginButton extends StatelessWidget {
   CUstomSocialLoginButton({
    super.key,
    this.borderRadius,
    required this.text,
    required this.icon,
    this.fontSize,
    this.onPressed,
  });
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
  Widget icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xfffafff6),
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.grey, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(8.r)),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 85.w),
            child: Row(
              children: [
               icon,
               SizedBox(width: context.width/40,),
                Text(
                  text,
                  style: Styles.textStyle18.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
