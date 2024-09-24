import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/profile/create_profile.dart';
import 'package:austism/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPScreen1 extends StatefulWidget {
  final String verificationId; // Receive verification ID from AuthController
  const OTPScreen1({super.key, required this.verificationId});

  @override
  State<OTPScreen1> createState() => _OTPScreen1State();
}

class _OTPScreen1State extends State<OTPScreen1> {
  OtpFieldController otpController = OtpFieldController();
  String otpCode = "";

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
              Get.back();
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
                    "One Time Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Enter your OTP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.h,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  OTPTextField(
                    controller: otpController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceBetween,
                    fieldWidth: 55,
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: Colors.white,
                      disabledBorderColor: Colors.white,
                      enabledBorderColor: Colors.white,
                      focusBorderColor: Colors.white,
                      backgroundColor: Colors.transparent,
                    ),
                    outlineBorderRadius: 5.r,
                    obscureText: true,
                    style: TextStyle(fontSize: 29.sp, color: Colors.white),
                    onChanged: (pin) {
                      otpCode = pin; // Save OTP code
                    },
                    onCompleted: (pin) {
                      otpCode = pin;
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      verifyOTP(); // Call verify OTP when pressed
                    },
                    child: CustomButton(
                      textButton: "CONTINUE",
                      textColor: kprimaryColor,
                      widthh: 0.9.sw,
                      isIcon: false,
                      isBorder: true,
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

  void verifyOTP() async {
    if (otpCode.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter OTP");
      return;
    }

    try {
      // Create a PhoneAuthCredential with the OTP
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpCode,
      );

      // Sign the user in with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      Fluttertoast.showToast(msg: "OTP Verified");
      Get.to(() => const SetProfileScreen()); // Navigate to the next screen
    } catch (e) {
      Fluttertoast.showToast(msg: "Invalid OTP, please try again");
    }
  }
}
