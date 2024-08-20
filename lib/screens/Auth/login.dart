import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/auth_controller.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/forgot_password.dart';
import 'package:austism/screens/Auth/navigator.dart';
// import 'package:austism/screens/Auth/main/main_screen.dart';
import 'package:austism/screens/auth/signup.dart';
import 'package:austism/widgets/button.dart';
import 'package:austism/widgets/textfield.dart';
// import 'package:autistic/Helper/Colors.dart';
// import 'package:autistic/Widget/button.dart';
// import 'package:autistic/Widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import '../../Helper/Global.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final _controller = Get.put(AuthController());
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
              // Get.toNamed('/SocialLoginScreen');
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              // child: Container(
              //   height: 20.h,
              //   width: 20.w,
              //   decoration: const BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Colors.white,
              //   ),
              //   child: Image.asset(
              //     Appassets.arrowback,
              //     scale: 1.5,
              //     color: kprimaryColor,
              //   ),
              // ),
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
                    "Welcome back!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignupScreen());
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login below or',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' create an account',
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
                    controller: passController,
                    hinttext: "Password",
                    underlineColor: Colors.white,
                    hintColor: Colors.white,
                    widthh: 0.9.sw,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ForgotScreen());
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => NavigatorScreen());
                      _controller.login(
                          emailController.text, passController.text);
                    },
                    child: CustomButton(
                      textButton: "LOGIN",
                      textColor: kprimaryColor,
                      widthh: 0.9.sw,
                      isIcon: false,
                      isBorder: false,
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
