import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/widgets/custom_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RelationshipScreen extends StatelessWidget {
  RelationshipScreen({super.key});

  final List<String> relationImages = [
    Appassets.baby,
    Appassets.children,
    Appassets.friends,
    Appassets.family,
    Appassets.grandpa,
    Appassets.guardian,
    Appassets.parents,
    Appassets.partner,
    Appassets.siblings,
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
          "Relationship",
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
              itemCount: relationImages.length,
              itemBuilder: (context, index) {
                return CustomCart(path: relationImages[index]);
              },
            ),
          ),
          20.h.verticalSpace,
          SmoothPageIndicator(
            controller: _controller,
            count: relationImages.length,
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
