import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
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

  // final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Sports",
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
