import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/auth_controller.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/auth/login.dart';
import 'package:austism/widgets/button.dart';
import 'package:austism/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  final phoneNumberController = TextEditingController();
  bool _obscure = true;

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
                    "Create account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  35.h.verticalSpace,
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
                    hinttext: "Phone Number",
                    controller: phoneNumberController,
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
                        icon: Icon(_obscure
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      _authController.register(emailController.text,
                          passController.text, phoneNumberController.text);
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
                  30.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
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
