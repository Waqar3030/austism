import 'package:austism/components/speech.dart';
import 'package:austism/resources/appAssets.dart';
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
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 20.h,
              width: 20.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(
                Appassets.arrowback,
                scale: 1.5,
                color: kprimaryColor,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Alphabets",
          style: TextStyle(
            color: kprimaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 35.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.h.verticalSpace,
            SizedBox(
                height: Get.height * .85,
                child: ProductGrid(products: products)),
          ],
        ).paddingSymmetric(horizontal: 10.w),
      ),
    );
  }
}
