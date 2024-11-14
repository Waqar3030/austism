import 'dart:ui';
import 'package:austism/components/auth_field.dart';
import 'package:austism/components/primary_button.dart';
import 'package:austism/controller/auth_controller.dart';
import 'package:austism/controller/bottom_controller.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/app_loader.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/screens/Auth/forgot_password.dart';
import 'package:austism/screens/Auth/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _controller = Get.put(AuthController());
  final navigatorController = Get.put(BottomController());
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/184.png"),
            // filterQuality: FilterQuality.low,
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(20.r),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    30.r.verticalSpace,
                    Image.asset(
                      "assets/images/app_icon.png",
                      scale: 3.8,
                    ),
                    10.r.verticalSpace,
                    Text('Let’s Sign you in',
                        style: AppTextStyle.medium.copyWith(
                            fontSize: 26.r,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kWhite)),
                    30.r.verticalSpace,
                    AuthField(
                      title: 'Email Address',
                      hintText: 'Enter your email address',
                      controller: emailController,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Email is required';
                      //   } else if (!value.isEmail) {
                      //     return 'Invalid email address';
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    15.r.verticalSpace,
                    // Password Field.
                    AuthField(
                      title: 'Password',
                      hintText: 'Enter your password',
                      controller: passController,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Password is required';
                      //   } else if (value.length < 8) {
                      //     return 'Password should be at least 8 characters long';
                      //   }
                      //   return null;
                      // },
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    5.r.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ForgotScreen());
                          },
                          child: Text(
                            "Forgot Password?",
                            style: AppTextStyle.small.copyWith(
                              color: AppColors.kWhite,
                              fontSize: 18.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                    30.r.verticalSpace,
                    GetBuilder<AuthController>(
                      init: _controller,
                      builder: (_) => _controller.isLoading
                          ? AppLoader.spinkit
                          : PrimaryButton(
                              onTap: () {
                                _controller.login(
                                    emailController.text, passController.text);
                                navigatorController.navBarChange(0);
                              },
                              text: 'Sign In',
                            ),
                    ),
                    50.r.verticalSpace,
                    RichText(
                      text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: AppTextStyle.small.copyWith(
                            fontSize: 18.r,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kWhite),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const SignupScreen());
                              },
                            style: AppTextStyle.small.copyWith(
                                fontSize: 18.r,
                                fontWeight: FontWeight.w700,
                                color: AppColors.kPrimary),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
