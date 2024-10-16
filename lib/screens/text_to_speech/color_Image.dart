import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
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
            SizedBox(
                height: Get.height * .80,
                child: ProductGrid(products: products)),
          ],
        ).paddingSymmetric(horizontal: 20.w));
  }
}
