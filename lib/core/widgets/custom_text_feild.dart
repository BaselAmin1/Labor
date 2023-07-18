import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    super.key,
     this.label,
     this.onTap,
     this.onSubmit,
     this.isPassword=false,
     this.suffixIcon,
    this.suffixPressed,
    this.keyboardType,
    this.controller
  });
  TextEditingController? controller;
  dynamic label;
  String? hintText;
  TextInputType? keyboardType;
  void Function() ?onTap;
  void Function(String)? onChange;
  Function(String)? onSubmit;
  String? Function(String?)? validation;
  bool isPassword = false;
  IconData? suffixIcon;
  void Function()? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.start,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validation,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        hintText: label,
        filled: true,
        hoverColor: const Color(0xfffafff6),
        fillColor: const Color(0xfffafff6),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 12.sp,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff5FD068),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 226, 219, 219),
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(12.w, 0.h, 12.w, 0.h),
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon))
            : null,
      ),
    );
  }
}
