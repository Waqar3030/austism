import 'package:austism/resources/colors.dart';
import 'package:austism/components/appBar.dart';
import 'package:austism/components/button.dart';
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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: "Visual Schedule",
          )),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "My Schedule",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.1.sh,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 0.35.sh,
                    width: 0.9.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  Positioned(
                    left: 0.05.sw,
                    bottom: -0.05.sh,
                    child: Container(
                      height: 0.45.sh,
                      width: 0.8.sw,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0.25.sh,
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 0.1.sh,
                            width: 0.7.sw,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                "Lorem ipsum dolor sit amet consectetur adipiscing elit suscipit commodo enim tellus et nascetur at leo accumsan, odio habitan",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0.2.sw,
                    top: -0.07.sh,
                    child: Image.asset(
                      "assets/images/Untitled-1.png",
                      scale: 1.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.1.sh,
              ),
              GestureDetector(
                onTap: () {
                  // Get.toNamed('/CreateVisualScheduleScreen');
                },
                child: CustomButton(
                  textButton: "CREATE VISUAL SCHEDULE",
                  textColor: Colors.white,
                  widthh: 0.9.sw,
                  isIcon: false,
                  isBorder: false,
                  buttonColor: greenColor,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 14.w),
        ),
      ),
    );
  }
}
