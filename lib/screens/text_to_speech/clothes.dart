import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClothesScreen extends StatelessWidget {
  ClothesScreen({super.key});

  List<Map<String, String>> products = [
    {'name': 'Cap', 'image': Appassets.cap},
    {'name': 'Gloves', 'image': Appassets.gloves},
    {'name': 'Hat', 'image': Appassets.hat},
    {'name': 'Jacket', 'image': Appassets.jacket},
    {'name': 'Scarf', 'image': Appassets.scarf},
    {'name': 'Shirt', 'image': Appassets.shirt},
    {'name': 'Socks', 'image': Appassets.socks},
    {'name': 'T-Shirt', 'image': Appassets.t_shirt},
    {'name': 'Underwear', 'image': Appassets.underwear},
    {'name': 'Backpack', 'image': Appassets.backpack},
  ];

  // final PageController _controller = PageController();

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
          "Clothes",
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
