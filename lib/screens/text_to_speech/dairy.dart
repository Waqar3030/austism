import 'package:austism/components/custom_cart.dart';
import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Dairy",
          style: TextStyle(
            color: kprimaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 35.sp,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          30.h.verticalSpace,
          SizedBox(
              height: Get.height * .85, child: ProductGrid(products: products)),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
