import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/auth_controller.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/otp1.dart';

// import 'package:austism/screens/Auth/profile/create_profile.dart';
import 'package:austism/screens/auth/login.dart';
import 'package:austism/widgets/button.dart';
import 'package:austism/widgets/textfield.dart';
// import 'package:autistic/Helper/Colors.dart';
// import 'package:autistic/Widget/button.dart';
// import 'package:autistic/Widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'profile/create_profile.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool check = false;
  final _authController = Get.put(AuthController());
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
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
              Get.to(() => LoginScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
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
                    "Create account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Enter your account details below or ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'log in',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  AuthTextField(
                    hinttext: "Name",
                    underlineColor: Colors.white,
                    hintColor: Colors.white,
                    widthh: 0.9.sw,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AuthTextField(
                    controller: emailController,
                    hinttext: "Email",
                    underlineColor: Colors.white,
                    hintColor: Colors.white,
                    widthh: 0.9.sw,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AuthTextField(
                    hinttext: "Family Name",
                    underlineColor: Colors.white,
                    hintColor: Colors.white,
                    widthh: 0.9.sw,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      obscureText: false,
                      controller: passController,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 16,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(10.r)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      obscureText: false,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: "Repeat Password",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 16,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(10.r)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: check,
                        onChanged: (value) {
                          setState(
                            () {
                              check = value!;
                            },
                          );
                        },
                        shape: CircleBorder(),
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignupScreen());
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'I agree to the ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'term of service',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: ' & ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'privacy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      _authController.register(
                          emailController.text, passController.text);
                      // Get.to(() => const OTPScreen1());
                    },
                    child: CustomButton(
                      textButton: "SIGN UP",
                      textColor: kprimaryColor,
                      widthh: 0.9.sw,
                      isIcon: false,
                      isBorder: true,
                      buttonColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
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
