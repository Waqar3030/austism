import 'package:austism/components/custom_cart.dart';
import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DairyScreen extends StatelessWidget {
  DairyScreen({super.key});

  List<Map<String, String>> products = [
    {'name': 'Butter', 'image': Appassets.butter},
    {'name': 'Cheese', 'image': Appassets.cheese},
    {'name': 'Cream Cheese', 'image': Appassets.cream_cheese},
    {'name': 'Eggs', 'image': Appassets.eggs},
    {'name': 'Yogurt', 'image': Appassets.yogurt},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Dairy",
          style: AppTextStyle.medium.copyWith(
            color: Colors.indigo[700]!,
            fontWeight: FontWeight.w800,
            fontSize: 24.sp,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.keyboard_backspace_sharp,
              color: Colors.indigo[700]!,
              size: 30.sp,
            )),
      ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              30.r.verticalSpace,
              SizedBox(
                  height: Get.height * .83,
                  child: ProductGrid(products: products)),
            ],
          ).paddingSymmetric(horizontal: 10.r),
        ),
      ),
    );
  }
}
