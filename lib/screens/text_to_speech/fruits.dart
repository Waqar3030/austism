import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FruitsScreen extends StatelessWidget {
  FruitsScreen({super.key});

  List<Map<String, String>> products = [
    {'name': 'Apple', 'image': Appassets.apple},
    {'name': 'Banana', 'image': Appassets.banana},
    {'name': 'Pineapple', 'image': Appassets.pineapple},
    {'name': 'Strawberry', 'image': Appassets.strawberry},
    {'name': 'Orange', 'image': Appassets.orangef},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Fruits",
          style: TextStyle(
            color: greenColor,
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
