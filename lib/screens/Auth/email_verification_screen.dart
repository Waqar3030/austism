import 'package:austism/components/button.dart';
import 'package:austism/controller/auth_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Appassets.splash1),
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
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 64.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: Image.asset(
                      "assets/images/app_icon.png",
                      scale: 3.8,
                    ),
                  ),
                  Text(
                    "Email Verification",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Check your email for a verification link",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.h,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 35.h),
                  GestureDetector(
                    onTap: () {
                      authController
                          .verifyEmail(); // Call to verify email status
                    },
                    child: CustomButton(
                      textButton: "VERIFY EMAIL",
                      textColor: kprimaryColor,
                      widthh: 0.9.sw,
                      isIcon: false,
                      buttonColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
