import 'dart:ui';

import 'package:austism/components/button.dart';
import 'package:austism/components/textfield.dart';
import 'package:austism/controller/auth_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/forgot_password.dart';
import 'package:austism/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool _isObscure = true;

  final _controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Appassets.splash1),
            // image: AssetImage(Appassets.background),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              50.h.verticalSpace,
              Center(
                child: Image.asset(
                  "assets/images/app_icon.png",
                  scale: 3.8,
                ),
              ),
              30.h.verticalSpace,
              Text(
                "Welcome back!",
                style: AppTextStyle.heading.copyWith(
                  color: Colors.white,
                  fontSize: 30.h,
                  fontWeight: FontWeight.w600,
                ),
              ),
              40.h.verticalSpace,
              AuthTextField(
                controller: emailController,
                hinttext: "Email",
                underlineColor: Colors.white,
                hintColor: Colors.white,
                widthh: 0.9.sw,
                isPassword: false,
              ),
              20.h.verticalSpace,
              AuthTextField(
                controller: passController,
                hinttext: "Password",
                underlineColor: Colors.white,
                hintColor: Colors.white,
                widthh: 0.9.sw,
                isPassword: _isObscure,
                suffixicon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: white)),
              ),
              15.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ForgotScreen());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: AppTextStyle.small.copyWith(
                        color: black,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              50.h.verticalSpace,
              GestureDetector(
                onTap: () {
                  // Get.to(() => NavigatorScreen());
                  _controller.login(emailController.text, passController.text);
                },
                child: CustomButton(
                  textButton: "LOGIN",
                  textColor: kprimaryColor,
                  widthh: 0.9.sw,
                  isIcon: false,
                  buttonColor: Colors.white,
                ),
              ),
              // 90.h.verticalSpace,
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account? ",
                    style: AppTextStyle.small.copyWith(
                      color: Colors.white,
                      fontSize: 26.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignupScreen());
                    },
                    child: Text(
                      "SignUp",
                      style: AppTextStyle.medium.copyWith(
                        color: Colors.white,
                        fontSize: 30.h,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 30.h)
            ],
          ).paddingSymmetric(horizontal: 40.w),
        ),
      ),
    );
  }
}
