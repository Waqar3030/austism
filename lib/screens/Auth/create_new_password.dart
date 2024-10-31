import 'package:austism/components/auth_field.dart';
import 'package:austism/components/primary_button.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/screens/auth/login.dart';
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
              20.r.verticalSpace,
              Text(
                "Create New Pasword",
                style: AppTextStyle.medium.copyWith(
                  color: AppColors.kWhite,
                  fontSize: 26.r,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Enter your new password",
                style: AppTextStyle.small.copyWith(
                  color: AppColors.kWhite,
                  fontSize: 16.r,
                  fontWeight: FontWeight.w500,
                ),
              ),
              20.r.verticalSpace,
              AuthField(
                  title: "New Password",
                  hintText: "Enter Password",
                  controller: passController),
              20.r.verticalSpace,
              AuthField(
                  title: "Confirm New Password",
                  hintText: "Enter your Password",
                  controller: repeatPassController),
              30.r.verticalSpace,
              PrimaryButton(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                text: "Continue",
              )
            ],
          ).paddingSymmetric(horizontal: 20.r),
        ),
      ),
    );
  }
}
