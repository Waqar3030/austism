import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/profile/austism_detail.dart';
import 'package:austism/components/appBar.dart';
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
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(text: "Home Screen"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom app bar

              30.h.verticalSpace, // Increased space for cleaner design

              // Child image with shadow for better appearance
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    Appassets.child1,
                    height: 250.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              30.h.verticalSpace,

              // Informative text with better spacing, padding, and design
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Understanding Autism Spectrum Disorder",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: kprimaryColor,
                      ),
                    ),
                    10.h.verticalSpace,
                    Text(
                      "Autism Spectrum Disorder (ASD) is a neurodevelopmental condition affecting communication, social interaction, and behavior. People with autism experience the world differently, often struggling with sensory processing and routines.",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    10.h.verticalSpace,
                    Text(
                      "While there's no single cause, early intervention and support can significantly improve quality of life.",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),

              30.h.verticalSpace,

              // Second image with shadow
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    Appassets.austism1,
                    height: 250.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              30.h.verticalSpace,

              // Custom button with animation
              GestureDetector(
                onTap: () {
                  Get.to(() => AustismDetail());
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 0.70.sw,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: kprimaryColor.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "CLICK HERE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              30.h.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
