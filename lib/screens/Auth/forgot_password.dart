import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/auth/login.dart';
import 'package:austism/screens/auth/otp.dart';
import 'package:austism/widgets/button.dart';
import 'package:austism/widgets/textfield.dart';
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
              Get.to(() => const LoginScreen());
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
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Enter your email",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.h,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  AuthTextField(
                    hinttext: "Email",
                    underlineColor: Colors.white,
                    hintColor: Colors.white,
                    widthh: 0.9.sw,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => OTPScreen());
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
