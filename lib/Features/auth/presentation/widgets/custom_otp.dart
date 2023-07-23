import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOTP extends StatelessWidget {
   CustomOTP({super.key,});
    late String otpCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: const Color(0xff5FD068),
          inactiveColor: Colors.grey,
          inactiveFillColor: const Color(0xffF9FFF6),
          activeFillColor: const Color(0xffF9FFF6),
          selectedColor: const Color(0xff5FD068),
          selectedFillColor: const Color(0xffF9FFF6),
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor:  Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
          print(otpCode);
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}