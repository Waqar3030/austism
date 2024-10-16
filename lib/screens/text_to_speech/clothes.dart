import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Clothes",
          style: TextStyle(
            color: kprimaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 30.sp,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          30.h.verticalSpace,
          SizedBox(
              height: Get.height * .80, child: ProductGrid(products: products)),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
