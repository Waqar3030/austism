import 'package:austism/components/auth_field.dart';
import 'package:austism/components/primary_button.dart';
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
  final emailController = TextEditingController();
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
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              20.h.verticalSpace,
              Center(
                child: Image.asset(
                  "assets/images/app_icon.png",
                  scale: 3.8,
                ),
              ),
              Text(
                "Forgot Password?",
                style: AppTextStyle.medium.copyWith(
                  color: Colors.white,
                  fontSize: 28.h,
                  fontWeight: FontWeight.w600,
                ),
              ),
              10.h.verticalSpace,
              Text(
                "Enter your email",
                style: AppTextStyle.small.copyWith(
                  color: Colors.white,
                  fontSize: 20.h,
                  fontWeight: FontWeight.w500,
                ),
              ),
              30.h.verticalSpace,
              AuthField(
                  title: "Email",
                  hintText: "Enter your Email",
                  controller: emailController),
              30.h.verticalSpace,
              PrimaryButton(
                  onTap: () {
                    Get.to(() => const CreateNewPasswordScreen());
                  },
                  text: 'Continue')
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
