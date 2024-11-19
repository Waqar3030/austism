import 'package:austism/components/custom_dialogbox.dart';
import 'package:austism/controller/bottom_controller.dart';
import 'package:austism/controller/child_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/navigator.dart';
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
  final bottomController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      Appassets.cross_black,
                      scale: 3.8,
                      color: Colors.indigo[700]!,
                    ),
                  ),
                ],
              ).paddingOnly(left: 40.w, right: 30.w),
              40.h.verticalSpace,
              GetBuilder(
                  init: childcontroller,
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.parentname,
                                style: AppTextStyle.heading.copyWith(
                                  color: Colors.indigo[700]!,
                                  fontSize: 32.sp,
                                )),
                            Text(controller.parentemail,
                                style: AppTextStyle.small.copyWith(
                                  color: Colors.indigo[700]!,
                                  fontSize: 14.sp,
                                )),
                          ],
                        ),
                        Container(
                            height: 90.r,
                            width: 90.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(controller.parentimage),
                                fit: BoxFit.cover,
                              ),
                            )),
                      ],
                    );
                  }),
              40.h.verticalSpace,
              GestureDetector(
                onTap: () {
                  bottomController.navBarChange(0);
                  Get.to(() => const NavigatorScreen());
                },
                child: button("Home"),
              ),
              Spacer(),
              Row(
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
                          style: AppTextStyle.small.copyWith(
                            color: Colors.indigo[700]!,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 20.h)
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
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
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  txt,
                  style: AppTextStyle.small.copyWith(
                    color: Colors.indigo[700]!,
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
