import 'package:austism/components/speech.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EnglishAlphabets extends StatelessWidget {
  const EnglishAlphabets({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = [
      {'name': 'A', 'image': 'assets/images/letter-a.png'},
      {'name': 'B', 'image': 'assets/images/letter-b.png'},
      {'name': 'C', 'image': 'assets/images/letter-c.png'},
      {'name': 'D', 'image': 'assets/images/letter-d.png'},
      {'name': 'E', 'image': 'assets/images/letter-e.png'},
      {'name': 'F', 'image': 'assets/images/letter-f.png'},
      {'name': 'G', 'image': 'assets/images/letter-g.png'},
      {'name': 'H', 'image': 'assets/images/letter-h.png'},
      {'name': 'I', 'image': 'assets/images/letter-i.png'},
      {'name': 'J', 'image': 'assets/images/letter-j.png'},
      {'name': 'K', 'image': 'assets/images/letter-k.png'},
      {'name': 'L', 'image': 'assets/images/letter-l.png'},
      {'name': 'M', 'image': 'assets/images/letter-m.png'},
      {'name': 'N', 'image': 'assets/images/letter-n.png'},
      {'name': 'O', 'image': 'assets/images/letter-o.png'},
      {'name': 'P', 'image': 'assets/images/letter-p.png'},
      {'name': 'Q', 'image': 'assets/images/letter-q.png'},
      {'name': 'R', 'image': 'assets/images/letter-r.png'},
      {'name': 'S', 'image': 'assets/images/letter-s.png'},
      {'name': 'T', 'image': 'assets/images/letter-t.png'},
      {'name': 'U', 'image': 'assets/images/letter-u.png'},
      {'name': 'V', 'image': 'assets/images/letter-v.png'},
      {'name': 'W', 'image': 'assets/images/letter-w.png'},
      {'name': 'X', 'image': 'assets/images/letter-x.png'},
      {'name': 'Y', 'image': 'assets/images/letter-y.png'},
      {'name': 'Z', 'image': 'assets/images/letter-z.png'},
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Alphabets",
          style: AppTextStyle.medium.copyWith(
            color: greenColor,
            fontWeight: FontWeight.w800,
            fontSize: 24.sp,
          ),
        ),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                30.h.verticalSpace,
                SizedBox(
                    height: Get.height * .85,
                    child: ProductGrid(products: products)),
                10.h.verticalSpace
              ],
            ).paddingSymmetric(horizontal: 10.w),
          ),
        ),
      ),
    );
  }
}
