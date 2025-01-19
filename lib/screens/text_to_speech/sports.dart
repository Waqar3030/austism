import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SportsScreen extends StatelessWidget {
  SportsScreen({super.key});

  final List<String> sportImages = [
    Appassets.cricket,
    Appassets.basketball,
    Appassets.baseball,
    Appassets.boxing,
    Appassets.swimming,
    Appassets.tennis,
    Appassets.volleyball,
    Appassets.cycling,
    Appassets.driving,
  ];
  List<Map<String, String>> products = [
    {'name': 'Cricket', 'image': Appassets.cricket},
    {'name': 'Basketball', 'image': Appassets.basketball},
    {'name': 'Baseball', 'image': Appassets.baseball},
    {'name': 'Boxing', 'image': Appassets.boxing},
    {'name': 'Swimming', 'image': Appassets.swimming},
    {'name': 'Tennis', 'image': Appassets.tennis},
    {'name': 'Volleyball', 'image': Appassets.volleyball},
    {'name': 'Cycling', 'image': Appassets.cycling},
    {'name': 'Driving', 'image': Appassets.driving},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Sports",
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
              30.h.verticalSpace,
              SizedBox(
                  height: Get.height * .83,
                  child: ProductGrid(products: products)),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
