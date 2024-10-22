import 'package:austism/components/custom_dialogbox.dart';
import 'package:austism/controller/child_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/navigator.dart';
import 'package:austism/screens/diet_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final ChildController childcontroller = Get.put(ChildController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: const BoxDecoration(
        color: bprimaryColor,
      ),
      // width: double.infinity,
      child: GetBuilder(
          init: childcontroller,
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                80.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(controller.childimage),
                                fit: BoxFit.cover,
                              ),
                            )),
                        // Image.network(
                        //   controller.parentimage,
                        //   scale: 3.5,
                        // ),
                        20.w.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.parentname,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                              ),
                            ),
                            5.h.verticalSpace,
                            Text(
                              controller.parentemail,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        Appassets.cross_black,
                        scale: 3.8,
                        color: greenColor,
                      ),
                    ),
                  ],
                ).paddingOnly(left: 40.w, right: 30.w),
                40.h.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const NavigatorScreen());
                      },
                      child: button("Home"),
                    ),
                    15.h.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const DietPlan());
                      },
                      child: button("Diet Plan"),
                    ),
                    15.h.verticalSpace,
                    button("Setting"),
                    80.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            CustomDialogbox.logout(context);
                          },
                          child: Container(
                            height: 63.h,
                            width: 0.5.sw,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: kprimaryColor),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.r),
                                bottomRight: Radius.circular(30.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }

  button(txt) {
    return Row(
      children: [
        Container(
          height: 63.h,
          width: 0.7.sw,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.r),
              bottomRight: Radius.circular(5.r),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
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
