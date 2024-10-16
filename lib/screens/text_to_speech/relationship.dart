import 'package:austism/components/custom_cart.dart';
import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
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
  List<Map<String, String>> products = [
    {'name': 'Baby', 'image': Appassets.baby},
    {'name': 'Children', 'image': Appassets.children},
    {'name': 'Friends', 'image': Appassets.friends},
    {'name': 'Family', 'image': Appassets.family},
    {'name': 'Grandpa', 'image': Appassets.grandpa},
    {'name': 'Guardian', 'image': Appassets.guardian},
    {'name': 'Parents', 'image': Appassets.parents},
    {'name': 'Partner', 'image': Appassets.partner},
    {'name': 'Siblings', 'image': Appassets.siblings},
  ];

  // final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          30.h.verticalSpace,
          SizedBox(
              height: Get.height * .85, child: ProductGrid(products: products)),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
