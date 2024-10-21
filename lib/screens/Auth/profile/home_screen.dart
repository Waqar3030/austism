import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/profile/austism_detail.dart';
import 'package:austism/components/appBar.dart';
import 'package:austism/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: "Home Screen",
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.h.verticalSpace,
            Image.asset(Appassets.child1),
            20.h.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              // height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: kprimaryColor)),
              child: Text(
                "Autism Spectrum Disorder (ASD) is a neurodevelopmental condition affecting communication, social interaction, and behavior. People with autism experience the world differently, often struggling with sensory processing and routines. While there's no single cause, early intervention and support can significantly improve quality of life.",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            20.h.verticalSpace,
            Image.asset(Appassets.austism1),
            20.h.verticalSpace,
            GestureDetector(
              onTap: () {
                Get.to(() => AustismDetail());
              },
              child: CustomButton(
                textButton: "CLICK HERE",
                textColor: Colors.white,
                widthh: 0.70.sw,
                isIcon: false,
                buttonColor: kprimaryColor,
              ),
            ),
            20.h.verticalSpace,
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
