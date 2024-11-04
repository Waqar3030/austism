import 'package:austism/components/auth_field.dart';
import 'package:austism/components/primary_button.dart';
import 'package:austism/controller/forgot_pass_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/screens/Auth/create_new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final passController = Get.put(ForgotPassController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: AppColors.kPrimary,
          )),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Appassets.background),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              30.r.verticalSpace,
              Center(
                child: Image.asset(
                  "assets/images/app_icon.png",
                  scale: 3.8,
                ),
              ),
              Text(
                "Forgot Password?",
                style: AppTextStyle.medium.copyWith(
                  color: AppColors.kWhite,
                  fontSize: 28.r,
                  fontWeight: FontWeight.w600,
                ),
              ),
              10.r.verticalSpace,
              Text(
                "Enter your email",
                style: AppTextStyle.small.copyWith(
                  color: AppColors.kWhite,
                  fontSize: 20.r,
                  fontWeight: FontWeight.w500,
                ),
              ),
              30.h.verticalSpace,
              AuthField(
                  title: "Email",
                  hintText: "Enter your Email",
                  controller: passController.emailController),
              30.r.verticalSpace,
              PrimaryButton(
                  onTap: () {
                    passController.forgotPassword();
                  },
                  text: 'Continue')
            ],
          ).paddingSymmetric(horizontal: 20.r),
        ),
      ),
    );
  }
}
