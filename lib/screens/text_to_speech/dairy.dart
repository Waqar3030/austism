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

  final List<String> dairyImages = [
    Appassets.butter,
    Appassets.cheese,
    Appassets.cream_cheese,
    Appassets.eggs,
    Appassets.yogurt,
  ];
  List<Map<String, String>> products = [
    {'name': 'Butter', 'image': Appassets.butter},
    {'name': 'Cheese', 'image': Appassets.cheese},
    {'name': 'Cream Cheese', 'image': Appassets.cream_cheese},
    {'name': 'Eggs', 'image': Appassets.eggs},
    {'name': 'Yogurt', 'image': Appassets.yogurt},
  ];

  // final PageController _controller = PageController();

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
          // 20.h.verticalSpace,
          30.h.verticalSpace,
          SizedBox(
              height: Get.height * .85, child: ProductGrid(products: products)),
          // Expanded(
          //   child: PageView.builder(
          //     controller: _controller,
          //     itemCount: dairyImages.length,
          //     itemBuilder: (context, index) {
          //       return CustomCart(path: dairyImages[index]);
          //     },
          //   ),
          // ),
          // 20.h.verticalSpace,
          // SmoothPageIndicator(
          //   controller: _controller,
          //   count: dairyImages.length,
          //   effect: WormEffect(
          //     dotHeight: 10.h,
          //     dotWidth: 10.w,
          //     activeDotColor: kprimaryColor,
          //     dotColor: Colors.grey,
          //   ),
          // ),
        ],
      ).paddingOnly(left: 20.w, right: 20.w, top: 20.h, bottom: 50.h),
    );
  }
}
