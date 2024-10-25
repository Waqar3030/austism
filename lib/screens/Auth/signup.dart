// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final authController = Get.put(AuthController());
//   final emailController = TextEditingController();
//   final passController = TextEditingController();
//   final phoneNumberController = TextEditingController();
//   bool _obscure = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         surfaceTintColor: Colors.transparent,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Container(
//               height: 20.h,
//               width: 20.w,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: Image.asset(
//                 Appassets.arrowback,
//                 scale: 1.5,
//                 color: kprimaryColor,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               Appassets.splash1,
//             ),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: GetBuilder<AuthController>(
//           init: authController,
//           builder: (controller) {
//             return SafeArea(
//               child: Column(
//                 children: [
//                   50.h.verticalSpace,
//                   Center(
//                     child: Image.asset(
//                       "assets/images/app_icon.png",
//                       scale: 3.8,
//                     ),
//                   ),
//                   30.h.verticalSpace,
//                   Text(
//                     "Create account",
//                     style: AppTextStyle.medium.copyWith(
//                       color: Colors.white,
//                       fontSize: 28.h,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   40.h.verticalSpace,
//                   AuthTextField(
//                     hinttext: "Email",
//                     controller: emailController,
//                     underlineColor: Colors.white,
//                     hintColor: Colors.white,
//                     widthh: 0.9.sw,
//                     isPassword: false,
//                   ),
//                   20.h.verticalSpace,
//                   AuthTextField(
//                     hinttext: "Password",
//                     controller: passController,
//                     underlineColor: Colors.white,
//                     hintColor: Colors.white,
//                     widthh: 0.9.sw,
//                     isPassword: _obscure,
//                     suffixicon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             _obscure = !_obscure;
//                           });
//                         },
//                         icon: Icon(
//                             _obscure ? Icons.visibility : Icons.visibility_off,
//                             color: white)),
//                   ),
//                   50.h.verticalSpace,
//                   GestureDetector(
//                     onTap: () {
//                       controller.register(
//                           emailController.text, passController.text);
//                     },
//                     child: CustomButton(
//                       textButton: "SIGN UP",
//                       textColor: kprimaryColor,
//                       widthh: 0.9.sw,
//                       isIcon: false,
//                       buttonColor: Colors.white,
//                     ),
//                   ),
//                   Spacer(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Already have an account? ",
//                         style: AppTextStyle.small.copyWith(
//                           color: Colors.white,
//                           fontSize: 20.h,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Get.to(() => const LoginScreen());
//                         },
//                         child: Text(
//                           "Login",
//                           style: AppTextStyle.medium.copyWith(
//                             color: Colors.white,
//                             fontSize: 22.h,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ).paddingOnly(bottom: 30.h),
//                 ],
//               ).paddingSymmetric(horizontal: 20.w),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:austism/components/auth_field.dart';
import 'package:austism/components/primary_button.dart';
import 'package:austism/controller/auth_controller.dart';
import 'package:austism/resources/appColors.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          surfaceTintColor: AppColors.kWhite,
          elevation: 0,
          leading: const BackButton(
            color: AppColors.kPrimary,
          )),
      body: GetBuilder<AuthController>(
          init: authController,
          builder: (controller) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      const Text('Create Account',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 5),
                      const Text('Lorem ipsum dolor sit amet, consectetur',
                          style: TextStyle(
                              fontSize: 14, color: AppColors.kGrey60)),
                      const SizedBox(height: 30),
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
                      const SizedBox(height: 15),
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
                      const SizedBox(height: 30),
                      PrimaryButton(
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {}
                          controller.register(
                              emailController.text, passController.text);
                        },
                        text: 'Create An Account',
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
                              text: 'Login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => const LoginScreen());
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
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
// GestureDetector(
//                     onTap: () {
//                       controller.register(
//                           emailController.text, passController.text);
//                     },
//                     child: CustomButton(
//                       textButton: "SIGN UP",
//                       textColor: kprimaryColor,
//                       widthh: 0.9.sw,
//                       isIcon: false,
//                       buttonColor: Colors.white,
//                     ),
//                   ),