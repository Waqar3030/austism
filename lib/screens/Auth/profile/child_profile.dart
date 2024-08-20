import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChildProfile extends StatefulWidget {
  const ChildProfile({super.key});

  @override
  State<ChildProfile> createState() => _ChildProfileState();
}

class _ChildProfileState extends State<ChildProfile> {
  List<String> title = [
    "Name",
    "Gender",
    "Date of Birth",
    "Color",
    "Height",
    "Weight",
    "Country",
    "City"
  ];
  List<String> detailInfo = [
    "Adeel Akram",
    "Male",
    "22-1--2023",
    "Blue",
    "160 cm",
    "60 kg",
    "Pakistan",
    "Lahore"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          text: "Child Profile",
        ),
      ),
      body: Column(
        children: [
          15.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80.r,
                backgroundImage: AssetImage(
                  Appassets.parentPic,
                ),
              )
            ],
          ),
          20.h.verticalSpace,
          Text(
            "Adeel Akram",
            style: TextStyle(
                fontSize: 30.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Karachi, Pakistan",
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          20.h.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: kprimaryColor),
            ),
            child: Column(
              children: List.generate(title.length * 2 - 1, (index) {
                if (index.isEven) {
                  int itemIndex = index ~/ 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title[itemIndex],
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        detailInfo[itemIndex],
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Divider(
                    color: Colors.grey.shade500,
                    thickness: 1.0,
                  );
                }
              }),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 15.w),
    );
  }
}
