import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ColoursScreen extends StatelessWidget {
  ColoursScreen({super.key});

  final List<String> colorImages = [
    Appassets.black,
    Appassets.brown,
    Appassets.green,
    // Appassets.orange1,
    Appassets.pink,
    Appassets.purple,
    Appassets.red,
    Appassets.violet,
    Appassets.white,
    Appassets.yellow,
  ];
  List<Map<String, String>> products = [
    {
      'name': 'Black',
      'image': Appassets.black,
    },
    {'name': 'Blue', 'image': Appassets.blue},
    {'name': 'Brown', 'image': Appassets.brown},
    {'name': 'Green', 'image': Appassets.green},
    {'name': 'Pink', 'image': Appassets.pink},
    {'name': 'Purple', 'image': Appassets.purple},
    {'name': 'Red', 'image': Appassets.red},
    {'name': 'Violet', 'image': Appassets.violet},
    {'name': 'White', 'image': Appassets.white},
    {'name': 'Yellow', 'image': Appassets.yellow},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
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
                Appassets.arrowback,
                scale: 1.5,
                color: kprimaryColor,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Colours",
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
          // 20.h.verticalSpace,
          SizedBox(
              height: Get.height * .80, child: ProductGrid(products: products)),
        ],
      ).paddingOnly(left: 20.w, right: 20.w, top: 20.h, bottom: 50.h),
    );
  }
}
