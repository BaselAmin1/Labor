import 'package:flutter/material.dart';
import 'package:labor_app/constants.dart';
import 'package:labor_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.borderRadius,
    required this.text,
    this.fontSize,
     this.onPressed,
  });
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed:onPressed,
        style: TextButton.styleFrom(
          backgroundColor:  kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  8,
                ),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
