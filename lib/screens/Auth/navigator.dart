import 'package:austism/controller/bottom_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';

import 'package:austism/screens/Auth/profile/child_profile.dart';
import 'package:austism/screens/Auth/profile/home_screen.dart';
import 'package:austism/screens/Auth/profile/learning_screen.dart';
import 'package:austism/screens/viusal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  final _bottomController = Get.put(BottomController());

  final List<Widget> _pages = [
    const HomeScreen(),
    const ViusalScreen(),
    const LearningScreen(),
    const ChildProfile()
  ];

  Widget _buildNavItem(UserCustomBottomBarItem item, bool isSelected) {
    return GestureDetector(
      onTap: () =>
          _bottomController.navBarChange(listofUserBottomItems.indexOf(item)),
      child: Container(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromARGB(33, 255, 255, 255)
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: item.image,
            ),
            2.h.verticalSpace,
            Text(
              item.title,
              style: AppTextStyle.small.copyWith(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
            if (!isSelected) SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  Widget _buildMyNavBar(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 90.h,
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // height: 140.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2.r),
                    blurRadius: 15.r,
                    offset: Offset(0, -4.r),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
                color: greenColor,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listofUserBottomItems.map((item) {
              final isSelected =
                  _bottomController.userNavigationBarIndexValue ==
                      listofUserBottomItems.indexOf(item);
              return _buildNavItem(item, isSelected);
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomController>(
      builder: (_) {
        return Scaffold(
          body: _pages[_bottomController.userNavigationBarIndexValue],
          bottomNavigationBar: _buildMyNavBar(context),
        );
      },
    );
  }
}

class UserCustomBottomBarItem {
  final String title;
  final Widget image;

  UserCustomBottomBarItem({required this.title, required this.image});
}

final List<UserCustomBottomBarItem> listofUserBottomItems = [
  UserCustomBottomBarItem(
    title: "Home",
    image: Image.asset(
      Appassets.home,
      fit: BoxFit.scaleDown,
      height: 25.h,
      width: 25.w,
    ),
  ),
  UserCustomBottomBarItem(
    title: "Visual",
    image: Image.asset(
      Appassets.visualSchedule,
      fit: BoxFit.scaleDown,
      height: 25.h,
      width: 25.w,
    ),
  ),
  UserCustomBottomBarItem(
    title: "Learning",
    image: Image.asset(
      Appassets.learning_icon,
      fit: BoxFit.scaleDown,
      height: 25.h,
      width: 25.w,
    ),
  ),
  UserCustomBottomBarItem(
    title: "Profile",
    image: Image.asset(
      Appassets.profile,
      fit: BoxFit.scaleDown,
      height: 25.h,
      width: 25.w,
    ),
  ),
];
