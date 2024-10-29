import 'package:austism/resources/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/child_controller.dart';

class IntroCard extends StatelessWidget {
  final ChildController childcontroller = Get.put(ChildController());
  IntroCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: childcontroller,
        builder: (controller) {
          return Container(
            height: 190.r,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[800]!.withOpacity(.15),
                    offset: const Offset(0, 10),
                    blurRadius: 0,
                    spreadRadius: 0,
                  )
                ],
                gradient: const RadialGradient(
                  colors: [Color(0xff0E5C9E), Color(0xff031965)],
                  focal: Alignment.topCenter,
                  radius: .85,
                )),
            padding: EdgeInsets.all(25.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, ${controller.childname}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                height: 1.25,
                                fontFamily: "BigBottom",
                                fontWeight: FontWeight.bold)),
                        Text(controller.parentemail,
                            style: AppTextStyle.small.copyWith(
                              color: Colors.white.withOpacity(.75),
                              fontSize: 14.sp,
                            )),
                      ],
                    ),
                    Container(
                        height: 90.r,
                        width: 90.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(controller.childimage),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
