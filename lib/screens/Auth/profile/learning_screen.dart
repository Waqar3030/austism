import 'package:austism/resources/colors.dart';
import 'package:austism/screens/text_to_speech/alphabets.dart';
import 'package:austism/screens/text_to_speech/clothes.dart';
import 'package:austism/screens/text_to_speech/color_Image.dart';
import 'package:austism/screens/text_to_speech/dairy.dart';
import 'package:austism/screens/text_to_speech/fruits.dart';
import 'package:austism/screens/text_to_speech/relationship.dart';
import 'package:austism/screens/text_to_speech/sports.dart';
import 'package:austism/screens/text_to_speech/vegetables.dart';
import 'package:austism/components/appBar.dart';
import 'package:flutter/material.dart';
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
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: "Learning",
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.h.verticalSpace,
            item(
              text: "Alphabets",
              onTap: () {
                Get.to(() => const EnglishAlphabets());
              },
              // image: Appassets.cricket
            ),
            item(
              text: "Sports",
              onTap: () {
                Get.to(() => SportsScreen());
              },
              // image: Appassets.cricket
            ),
            item(
              text: "Fruit",
              onTap: () {
                Get.to(() => FruitsScreen());
              },

              // image: Appassets.fruits
            ),
            item(
              text: "Vegetables",
              onTap: () {
                Get.to(() => VegetablesScreen());
              },
              // image: Appassets.vegetables
            ),
            item(
              text: "Dairy",
              onTap: () {
                Get.to(() => DairyScreen());
              },
              // image: Appassets.dairy
            ),
            // item(text: "Animals", onTap: () {}, image: Appassets.animal),
            item(
              text: "Relationship",
              onTap: () {
                Get.to(() => RelationshipScreen());
              },
              // image: Appassets.parents
            ),
            item(
              text: "Colors",
              onTap: () {
                Get.to(() => ColoursScreen());
              },
              // image: Appassets.pink
            ),
            item(
              text: "Clothes",
              onTap: () {
                Get.to(() => ClothesScreen());
              },
              // image: Appassets.cap
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}

Widget item({
  required String text,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: kprimaryColor, borderRadius: BorderRadius.circular(30.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image.asset(
          //   image,
          //   fit: BoxFit.cover,
          //   height: 60.h,
          //   width: 60.w,
          //   // scale: 25.5,
          // ),
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
