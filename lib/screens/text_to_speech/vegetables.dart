import 'package:austism/components/custom_cart.dart';
import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VegetablesScreen extends StatelessWidget {
  VegetablesScreen({super.key});

  final List<String> vegImages = [
    Appassets.brocoli,
    Appassets.carrot,
    Appassets.corn,
    Appassets.potato,
    Appassets.tomato,
    // Appassets.orangef,
  ];
  List<Map<String, String>> products = [
    {'name': 'Broccoli', 'image': Appassets.brocoli},
    {'name': 'Carrot', 'image': Appassets.carrot},
    {'name': 'Corn', 'image': Appassets.corn},
    {'name': 'Potato', 'image': Appassets.potato},
    {'name': 'Tomato', 'image': Appassets.tomato},
  ];

  // final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Vegetables",
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
