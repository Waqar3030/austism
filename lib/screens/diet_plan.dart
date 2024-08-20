import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({super.key});

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  bool Daily = true;
  bool Weekly = false;
  bool Monthly = false;
  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
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
          "Diet Plan",
          style: TextStyle(
            color: kprimaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 35.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Row(
                  children: [
                    Text(
                      "Diet Plans",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 28.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 29.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          Daily = true;
                          Weekly = false;
                          Monthly = false;
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          "Daily",
                          style: TextStyle(
                            fontSize: 29.sp,
                            fontWeight: FontWeight.w400,
                            color: Daily
                                ? Colors.black
                                : Colors.black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 0.33.sw,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Daily
                                ? Colors.black
                                : Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          Daily = false;
                          Weekly = true;
                          Monthly = false;
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          "Weekly",
                          style: TextStyle(
                            fontSize: 29.sp,
                            fontWeight: FontWeight.w400,
                            color: Weekly
                                ? Colors.black
                                : Colors.black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 0.33.sw,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Weekly
                                ? Colors.black
                                : Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          Daily = false;
                          Weekly = false;
                          Monthly = true;
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          "Monthly",
                          style: TextStyle(
                            fontSize: 29.sp,
                            fontWeight: FontWeight.w400,
                            color: Monthly
                                ? Colors.black
                                : Colors.black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 0.33.sw,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Monthly
                                ? Colors.black
                                : Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 0.76.sh,
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed('/DietPlanIngredientsScreen');
                      },
                      child: Container(
                        height: (2 * 0.14).sh,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Breakfast",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 0.16.sh,
                                        width: 0.9.sw,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: Colors.grey.withOpacity(0.2),
                                          //     spreadRadius: 5,
                                          //     blurRadius: 7,
                                          //     offset: Offset(
                                          //         0, 3), // changes position of shadow
                                          //   ),
                                          // ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 19.w, vertical: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        width: 75.w,
                                                        height: 75.h,
                                                        child: Image.asset(
                                                          "assets/images/Rectangle 322.png",
                                                          scale: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 6,
                                                      ),
                                                      Text(
                                                        "Meal 1",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Text(
                                                        "3 Egg White's",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 23.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Container(
                                                        width: 0.65.sw,
                                                        height: 0.06.sh,
                                                        child: Text(
                                                          "Lorem ipsum dolor sit amet consectetur adipiscing elit suscipit commodo enim tellus et nascetur at leo accumsan, odio habitan",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed('/DietPlanIngredientsScreen');
                      },
                      child: Container(
                        height: (2 * 0.14).sh,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Lunch",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 0.16.sh,
                                        width: 0.9.sw,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: Colors.grey.withOpacity(0.2),
                                          //     spreadRadius: 5,
                                          //     blurRadius: 7,
                                          //     offset: Offset(
                                          //         0, 3), // changes position of shadow
                                          //   ),
                                          // ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 19.w, vertical: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        width: 75.w,
                                                        height: 75.h,
                                                        child: Image.asset(
                                                          "assets/images/Rectangle 322.png",
                                                          scale: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 6,
                                                      ),
                                                      Text(
                                                        "Meal 1",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Text(
                                                        "3 Egg White's",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 23.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Container(
                                                        width: 0.65.sw,
                                                        height: 0.06.sh,
                                                        child: Text(
                                                          "Lorem ipsum dolor sit amet consectetur adipiscing elit suscipit commodo enim tellus et nascetur at leo accumsan, odio habitan",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed('/DietPlanIngredientsScreen');
                      },
                      child: Container(
                        height: (2 * 0.14).sh,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Dinner",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 0.16.sh,
                                        width: 0.9.sw,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: Colors.grey.withOpacity(0.2),
                                          //     spreadRadius: 5,
                                          //     blurRadius: 7,
                                          //     offset: Offset(
                                          //         0, 3), // changes position of shadow
                                          //   ),
                                          // ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 19.w, vertical: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        width: 75.w,
                                                        height: 75.h,
                                                        child: Image.asset(
                                                          "assets/images/Rectangle 322.png",
                                                          scale: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 6,
                                                      ),
                                                      Text(
                                                        "Meal 1",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Text(
                                                        "3 Egg White's",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 23.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Container(
                                                        width: 0.65.sw,
                                                        height: 0.06.sh,
                                                        child: Text(
                                                          "Lorem ipsum dolor sit amet consectetur adipiscing elit suscipit commodo enim tellus et nascetur at leo accumsan, odio habitan",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
