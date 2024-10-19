import 'package:austism/components/drawer.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          Get.to(() => const DrawerScreen());
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
              "assets/images/Menu.png",
              scale: 2.0,
              // color: kprimaryColor,
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
          color: greenColor,
          fontWeight: FontWeight.w800,
          fontSize: 35.sp,
        ),
      ),
    );
  }
}
