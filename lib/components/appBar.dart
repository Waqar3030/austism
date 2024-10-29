import 'package:austism/components/drawer.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/apptext.dart';
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
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          Get.to(() => const DrawerScreen());
        },
        child: Image.asset(
          "assets/images/Menu.png",
          scale: 3.5,
          color: Colors.indigo[700]!,
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
        style: AppTextStyle.small.copyWith(
          color: Colors.indigo[700]!,
          fontWeight: FontWeight.w600,
          fontSize: 22.sp,
        ),
      ),
    );
  }
}
