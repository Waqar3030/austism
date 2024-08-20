import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/widgets/custom_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ColoursScreen extends StatelessWidget {
  ColoursScreen({super.key});

  final List<String> colorImages = [
    Appassets.black,
    Appassets.blue,
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

  final PageController _controller = PageController();

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
              decoration: BoxDecoration(
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
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: colorImages.length,
              itemBuilder: (context, index) {
                return CustomCart(path: colorImages[index]);
              },
            ),
          ),
          20.h.verticalSpace,
          SmoothPageIndicator(
            controller: _controller,
            count: colorImages.length,
            effect: WormEffect(
              dotHeight: 10.h,
              dotWidth: 10.w,
              activeDotColor: kprimaryColor,
              dotColor: Colors.grey,
            ),
          ),
        ],
      ).paddingOnly(left: 20.w, right: 20.w, top: 20.h, bottom: 50.h),
    );
  }
}
