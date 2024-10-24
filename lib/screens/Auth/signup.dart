import 'package:austism/components/button.dart';
import 'package:austism/components/textfield.dart';
import 'package:austism/controller/auth_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final authController = Get.put(AuthController());
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
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
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Appassets.splash1,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: GetBuilder<AuthController>(
          init: authController,
          builder: (controller) {
            return SafeArea(
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
                    "Create account",
                    style: AppTextStyle.medium.copyWith(
                      color: Colors.white,
                      fontSize: 28.h,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  40.h.verticalSpace,
                  AuthTextField(
                    hinttext: "Email",
                    controller: emailController,
                    underlineColor: Colors.white,
                    hintColor: Colors.white,
                    widthh: 0.9.sw,
                    isPassword: false,
                  ),
                  20.h.verticalSpace,
                  AuthTextField(
                    hinttext: "Password",
                    controller: passController,
                    underlineColor: Colors.white,
                    hintColor: Colors.white,
                    widthh: 0.9.sw,
                    isPassword: _obscure,
                    suffixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                        icon: Icon(
                            _obscure ? Icons.visibility : Icons.visibility_off,
                            color: white)),
                  ),
                  50.h.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      controller.register(
                          emailController.text, passController.text);
                    },
                    child: CustomButton(
                      textButton: "SIGN UP",
                      textColor: kprimaryColor,
                      widthh: 0.9.sw,
                      isIcon: false,
                      buttonColor: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: AppTextStyle.small.copyWith(
                          color: Colors.white,
                          fontSize: 20.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: Text(
                          "Login",
                          style: AppTextStyle.medium.copyWith(
                            color: Colors.white,
                            fontSize: 22.h,
                          ),
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: 30.h),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            );
          },
        ),
      ),
    );
  }
}
