import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/clothes.dart';
import 'package:austism/screens/color_Image.dart';
import 'package:austism/screens/dairy.dart';
import 'package:austism/screens/fruits.dart';
import 'package:austism/screens/relationship.dart';
import 'package:austism/screens/sports.dart';
import 'package:austism/screens/vegetables.dart';
import 'package:austism/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: "Learning",
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.h.verticalSpace,
            item(
                text: "Sports",
                onTap: () {
                  Get.to(() => SportsScreen());
                },
                image: Appassets.cricket),
            item(
                text: "Fruit",
                onTap: () {
                  Get.to(() => FruitsScreen());
                },
                image: Appassets.fruits),
            item(
                text: "Vegetables",
                onTap: () {
                  Get.to(() => VegetablesScreen());
                },
                image: Appassets.vegetables),
            item(
                text: "Dairy",
                onTap: () {
                  Get.to(() => DairyScreen());
                },
                image: Appassets.dairy),
            // item(text: "Animals", onTap: () {}, image: Appassets.animal),
            item(
                text: "Relationship",
                onTap: () {
                  Get.to(() => RelationshipScreen());
                },
                image: Appassets.parents),
            item(
                text: "Colors",
                onTap: () {
                  Get.to(() => ColoursScreen());
                },
                image: Appassets.pink),
            item(
                text: "Clothes",
                onTap: () {
                  Get.to(() => ClothesScreen());
                },
                image: Appassets.cap),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}

Widget item(
    {required String text,
    required VoidCallback onTap,
    required String image}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      decoration: BoxDecoration(
          color: kprimaryColor, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 60.h,
            width: 60.w,
            // scale: 25.5,
          ),
          20.w.horizontalSpace,
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
