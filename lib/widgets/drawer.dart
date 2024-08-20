import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/navigator.dart';
import 'package:austism/screens/diet_plan.dart';
import 'package:austism/widgets/custom_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: bprimaryColor,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.toNamed('/MainScreen');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              width: 108.w,
                              height: 108.h,
                              child: Image.asset(
                                Appassets.parentPic,
                                scale: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Adeel Akram",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26.sp,
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                "mark@example.com",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.sp,
                                ),
                              ),
                              SizedBox(
                                height: 36.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            Appassets.cross_black,
                            scale: 3.8,
                            color: kprimaryColor,
                          ),
                          Container(
                            width: 0,
                            height: 40,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              40.h.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => NavigatorScreen());
                    },
                    child: button("Home"),
                  ),
                  15.h.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      Get.to(() => DietPlan());
                    },
                    child: button("Diet Plan"),
                  ),
                  15.h.verticalSpace,
                  button("Setting"),
                  70.h.verticalSpace,
                  GestureDetector(
                      onTap: () {
                        CustomDialogbox.logout(context);
                      },
                      child: button("Logout")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  button(txt) {
    return Row(
      children: [
        Container(
          height: 63.h,
          width: 0.9.sw,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.r),
              bottomRight: Radius.circular(5.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  txt,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
