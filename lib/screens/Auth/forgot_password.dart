import 'package:austism/components/button.dart';
import 'package:austism/components/textfield.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/auth/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
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
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Appassets.splash1),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              20.h.verticalSpace,
              Center(
                child: Image.asset(
                  "assets/images/app_icon.png",
                  scale: 3.8,
                ),
              ),
              Text(
                "Forgot Password?",
                style: AppTextStyle.heading.copyWith(
                  color: Colors.white,
                  fontSize: 30.h,
                  fontWeight: FontWeight.w600,
                ),
              ),
              10.h.verticalSpace,
              Text(
                "Enter your email",
                style: AppTextStyle.small.copyWith(
                  color: Colors.white,
                  fontSize: 20.h,
                  fontWeight: FontWeight.w500,
                ),
              ),
              30.h.verticalSpace,
              AuthTextField(
                hinttext: "Email",
                underlineColor: Colors.white,
                hintColor: Colors.white,
                widthh: 0.9.sw,
                isPassword: false,
              ),
              30.h.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.to(() => const OTPScreen());
                },
                child: CustomButton(
                  textButton: "CONTINUE",
                  textColor: kprimaryColor,
                  widthh: 0.9.sw,
                  isIcon: false,
                  buttonColor: Colors.white,
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 40.w),
        ),
      ),
    );
  }
}
