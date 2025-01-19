import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ColoursScreen extends StatelessWidget {
  ColoursScreen({super.key});

  List<Map<String, String>> products = [
    {
      'name': 'Black',
      'image': Appassets.black,
    },
    {'name': 'Blue', 'image': Appassets.blue},
    {'name': 'Brown', 'image': Appassets.brown},
    {'name': 'Green', 'image': Appassets.green},
    {'name': 'Pink', 'image': Appassets.pink},
    {'name': 'Purple', 'image': Appassets.purple},
    {'name': 'Red', 'image': Appassets.red},
    {'name': 'Violet', 'image': Appassets.violet},
    {'name': 'White', 'image': Appassets.white},
    {'name': 'Yellow', 'image': Appassets.yellow},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Colors",
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
                SizedBox(
                    height: Get.height * .84,
                    child: ProductGrid(products: products)),
              ],
            ).paddingSymmetric(horizontal: 10.r),
          ),
        ));
  }
}
