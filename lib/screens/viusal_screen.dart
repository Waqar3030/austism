import 'package:austism/components/primary_button.dart';
import 'package:austism/components/appBar.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViusalScreen extends StatefulWidget {
  const ViusalScreen({super.key});

  @override
  State<ViusalScreen> createState() => _ViusalScreenState();
}

class _ViusalScreenState extends State<ViusalScreen> {
  // List<String> schedule = [
  //   "assets/images/Untitled-1.png",
  //   "assets/images/exercise.png",
  //   "assets/images/lunch.png"
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: "Visual Schedule",
          )),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue[50]!,
            Colors.blueAccent,
            Colors.purple[300]!
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Column(
            children: [
              30.r.verticalSpace,
              Row(
                children: [
                  Text(
                    "My Schedule",
                    style: AppTextStyle.medium.copyWith(
                      color: AppColors.kWhite,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              50.r.verticalSpace,
              Container(
                // height: 0.43.sh,
                width: 0.8.sw,
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.2),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/Untitled-1.png",
                      scale: 1.5,
                    ),
                    Text(
                      "7:00 AM",
                      style: TextStyle(
                        color: Color(0xff121137),
                        fontWeight: FontWeight.w300,
                        fontSize: 24.sp,
                      ),
                    ),
                    Text(
                      "WAKE UP",
                      style: TextStyle(
                        color: Color(0xff121137),
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.1.sh,
              ),
              PrimaryButton(
                onTap: () {},
                text: "Create Schedule",
              )
            ],
          ).paddingSymmetric(horizontal: 14.w),
        ),
      ),
    );
  }
}
