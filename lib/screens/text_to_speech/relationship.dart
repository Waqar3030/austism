import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Relationship",
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
              30.r.verticalSpace,
              SizedBox(
                  height: Get.height * .83,
                  child: ProductGrid(products: products)),
            ],
          ).paddingSymmetric(horizontal: 10.r),
        ),
      ),
    );
  }
}
