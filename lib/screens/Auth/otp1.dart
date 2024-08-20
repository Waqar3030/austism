import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/create_new_password.dart';
import 'package:austism/screens/Auth/profile/create_profile.dart';
import 'package:austism/widgets/button.dart';
// import 'package:autistic/Helper/Colors.dart';
// import 'package:autistic/Widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen1 extends StatefulWidget {
  const OTPScreen1({super.key});

  @override
  State<OTPScreen1> createState() => _OTPScreen1State();
}

class _OTPScreen1State extends State<OTPScreen1> {
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Appassets.background),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 20.h,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  Appassets.arrowback,
                  scale: 1.5,
                  color: kprimaryColor,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 64.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Image.asset(
                      Appassets.austismLogo,
                      scale: 1,
                    ),
                  ),
                  Text(
                    "One Time Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Enter your OTP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.h,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  OTPTextField(
                    controller: otpController,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceBetween,
                    fieldWidth: 55,
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: Colors.white,
                      disabledBorderColor: Colors.white,
                      enabledBorderColor: Colors.white,
                      focusBorderColor: Colors.white,
                      backgroundColor: Colors.transparent,
                    ),
                    outlineBorderRadius: 5.r,
                    obscureText: true,
                    style: TextStyle(fontSize: 29.sp, color: Colors.white),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SetProfileScreen());
                    },
                    child: CustomButton(
                      textButton: "CONTINUE",
                      textColor: kprimaryColor,
                      widthh: 0.9.sw,
                      isIcon: false,
                      isBorder: true,
                      buttonColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
