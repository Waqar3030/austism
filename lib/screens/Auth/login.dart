// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

//   bool _isObscure = true;

//   final _controller = Get.put(AuthController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         height: Get.height,
//         width: Get.width,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(Appassets.splash1),
//             // image: AssetImage(Appassets.background),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               50.h.verticalSpace,
//               Center(
//                 child: Image.asset(
//                   "assets/images/app_icon.png",
//                   scale: 3.8,
//                 ),
//               ),
//               30.h.verticalSpace,
//               Text(
//                 "Welcome back!",
//                 style: AppTextStyle.medium.copyWith(
//                   color: Colors.white,
//                   fontSize: 28.h,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               40.h.verticalSpace,
//               AuthTextField(
//                 controller: emailController,
//                 hinttext: "Email",
//                 underlineColor: Colors.white,
//                 hintColor: Colors.white,
//                 widthh: 0.9.sw,
//                 isPassword: false,
//               ),
//               20.h.verticalSpace,
//               AuthTextField(
//                 controller: passController,
//                 hinttext: "Password",
//                 underlineColor: Colors.white,
//                 hintColor: Colors.white,
//                 widthh: 0.9.sw,
//                 isPassword: _isObscure,
//                 suffixicon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         _isObscure = !_isObscure;
//                       });
//                     },
//                     icon: Icon(
//                         _isObscure ? Icons.visibility : Icons.visibility_off,
//                         color: white)),
//               ),
//               10.h.verticalSpace,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(() => const ForgotScreen());
//                     },
//                     child: Text(
//                       "Forgot Password?",
//                       style: AppTextStyle.small.copyWith(
//                         color: black,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               50.h.verticalSpace,
//               GestureDetector(
//                 onTap: () {
//                   // Get.to(() => NavigatorScreen());
//                   _controller.login(emailController.text, passController.text);
//                 },
//                 child: CustomButton(
//                   textButton: "LOGIN",
//                   textColor: kprimaryColor,
//                   widthh: 0.9.sw,
//                   isIcon: false,
//                   buttonColor: Colors.white,
//                 ),
//               ),
//               // 90.h.verticalSpace,
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Dont't have an account? ",
//                     style: AppTextStyle.small.copyWith(
//                       color: Colors.white,
//                       fontSize: 20.h,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//
//                     },
//                     child: Text(
//                       "SignUp",
//                       style: AppTextStyle.medium.copyWith(
//                         color: Colors.white,
//                         fontSize: 22.h,
//                         // fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ).paddingOnly(bottom: 30.h)
//             ],
//           ).paddingSymmetric(horizontal: 20.w),
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:austism/components/auth_field.dart';
import 'package:austism/components/primary_button.dart';
import 'package:austism/controller/auth_controller.dart';
import 'package:austism/resources/appColors.dart';
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
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _controller = Get.put(AuthController());
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      // appBar: AppBar(
      //     backgroundColor: AppColors.kWhite,
      //     elevation: 0,
      //     leading: const BackButton(
      //       color: AppColors.kPrimary,
      //     )),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/184.png"),
            // filterQuality: FilterQuality.low,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/app_icon.png",
                      scale: 3.8,
                    ),
                    10.h.verticalSpace,
                    Text('Let’s Sign you in',
                        style: AppTextStyle.medium.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kWhite)),
                    const SizedBox(height: 5),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur',
                      style: TextStyle(fontSize: 14, color: AppColors.kGrey60),
                    ),
                    const SizedBox(height: 30),
                    // Email Field.
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
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ForgotScreen());
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    PrimaryButton(
                      onTap: () {
                        _controller.login(
                            emailController.text, passController.text);
                      },
                      text: 'Sign In',
                    ),
                    50.h.verticalSpace,
                    RichText(
                      text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kGrey70),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const SignupScreen());
                              },
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.kPrimary),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    const SizedBox(height: 20),
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
