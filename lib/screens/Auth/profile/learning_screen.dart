import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/screens/text_to_speech/alphabets.dart';
import 'package:austism/screens/text_to_speech/clothes.dart';
import 'package:austism/screens/text_to_speech/color_Image.dart';
import 'package:austism/screens/text_to_speech/dairy.dart';
import 'package:austism/screens/text_to_speech/fruits.dart';
import 'package:austism/screens/text_to_speech/numbers.dart';
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
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: "Learning",
          )),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.r.verticalSpace,
                item(
                  text: "Alphabets",
                  onTap: () {
                    Get.to(() => const EnglishAlphabets());
                  },
                ),
                item(
                  text: "Sports",
                  onTap: () {
                    Get.to(() => SportsScreen());
                  },
                ),
                item(
                  text: "Fruit",
                  onTap: () {
                    Get.to(() => FruitsScreen());
                  },

                ),
                item(
                  text: "Vegetables",
                  onTap: () {
                    Get.to(() => VegetablesScreen());
                  },
                ),
                item(
                  text: "Dairy",
                  onTap: () {
                    Get.to(() => DairyScreen());
                  },
                ),
                item(
                  text: "Relationship",
                  onTap: () {
                    Get.to(() => RelationshipScreen());
                  },
                ),
                item(
                  text: "Colors",
                  onTap: () {
                    Get.to(() => ColoursScreen());
                  },
                ),
                item(
                  text: "Clothes",
                  onTap: () {
                    Get.to(() => ClothesScreen());
                  },
                ),
                item(
                  text: "Numbers",
                  onTap: () {
                    Get.to(() => NumbersScreen());
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 10.r),
          ),
        ),
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
      margin: EdgeInsets.symmetric(vertical: 8.r),
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: const Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          gradient: const LinearGradient(
              colors: [Color(0xff0E5C9E), Color(0xff031965)],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyle.small.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.kWhite),
          ),
          Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                gradient: const LinearGradient(
                    colors: [Colors.yellow, Colors.orange],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 30,
              )),
        ],
      ),
    ),
  );
}
