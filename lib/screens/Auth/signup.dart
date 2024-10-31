import 'package:austism/components/auth_field.dart';
import 'package:austism/components/primary_button.dart';
import 'package:austism/controller/auth_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/app_loader.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/screens/Auth/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.keyboard_backspace_sharp,
              color: AppColors.kPrimary,
              size: 30.sp,
            )),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Appassets.background),
            fit: BoxFit.cover,
            // image: AssetImage(Appassets.background),
          ),
        ),
        child: GetBuilder<AuthController>(
            init: authController,
            builder: (controller) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: SafeArea(
                  child: Form(
                    child: Column(
                      children: [
                        30.r.verticalSpace,
                        Image.asset(
                          "assets/images/app_icon.png",
                          scale: 3.8,
                        ),
                        10.r.verticalSpace,
                        Text('Create Account',
                            style: AppTextStyle.medium.copyWith(
                                fontSize: 26.r,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kWhite)),

                        10.r.verticalSpace,
                        // FullName.
                        AuthField(
                          title: 'Full Name',
                          hintText: 'Enter your name',
                          controller: _nameController,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Name is required';
                          //   } else if (!RegExp(r'^[a-zA-Z ]+ $')
                          //       .hasMatch(value)) {
                          //     return 'Please enter a valid name';
                          //   }
                          //   return null;
                          // },
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                        10.r.verticalSpace,
                        // Email Field.
                        AuthField(
                          title: 'E-mail',
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
                        10.r.verticalSpace,
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
                        30.r.verticalSpace,
                        controller.isLoading
                            ? AppLoader.spinkit
                            : PrimaryButton(
                                onTap: () {
                                  controller.register(emailController.text,
                                      passController.text);
                                },
                                text: 'Create An Account',
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
                                text: 'Login',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(() => const LoginScreen());
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
              );
            }),
      ),
    );
  }
}
