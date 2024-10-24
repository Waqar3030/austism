import 'package:austism/components/textfield.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/auth/login.dart';
import 'package:austism/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final passController = TextEditingController();
  final repeatPassController = TextEditingController();
  bool _isObscure = true;
  bool _isObscure1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.toNamed('/OTPScreen');
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
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Appassets.splash1),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              30.h.verticalSpace,
              Center(
                child: Image.asset(
                  "assets/images/app_icon.png",
                  scale: 3.8,
                ),
              ),
              20.h.verticalSpace,
              Text(
                "Create New Pasword",
                style: AppTextStyle.medium.copyWith(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Enter your new password",
                style: AppTextStyle.small.copyWith(
                  color: Colors.white,
                  fontSize: 18.h,
                  fontWeight: FontWeight.w500,
                ),
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
              20.h.verticalSpace,
              AuthTextField(
                controller: repeatPassController,
                hinttext: "Password",
                underlineColor: Colors.white,
                hintColor: Colors.white,
                widthh: 0.9.sw,
                isPassword: _isObscure1,
                suffixicon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure1 = !_isObscure1;
                      });
                    },
                    icon: Icon(
                        _isObscure1
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: white)),
              ),
              30.h.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: CustomButton(
                  textButton: "CONTINUE",
                  textColor: kprimaryColor,
                  widthh: 0.9.sw,
                  isIcon: false,
                  buttonColor: Colors.white,
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
