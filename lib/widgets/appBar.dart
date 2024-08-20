import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomAppbar extends StatelessWidget {
  final String text;
  CustomAppbar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          Get.to(() => DrawerScreen());
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              "assets/images/Group 18.png",
              scale: 1.5,
              color: kprimaryColor,
            ),
          ),
        ),
      ),
      // leading: Image.asset(
      //   Appassets.arrowback,
      //   scale: 1.5,
      //   color: kprimaryColor,
      // ),
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(
          color: kprimaryColor,
          fontWeight: FontWeight.w800,
          fontSize: 35.sp,
        ),
      ),
    );
  }
}
