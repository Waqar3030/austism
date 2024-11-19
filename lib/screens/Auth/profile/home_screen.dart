import 'package:austism/components/home_intro.dart';
import 'package:austism/controller/bottom_controller.dart' as bottomController;
import 'package:austism/components/appBar.dart';
import 'package:austism/controller/child_controller.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/app_loader.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/screens/text_to_speech/alphabets.dart';
import 'package:austism/screens/text_to_speech/clothes.dart';
import 'package:austism/screens/text_to_speech/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ChildController childcontroller = Get.put(ChildController());
  @override
  initState() {
    super.initState();
    Future.microtask(() => childcontroller.fetchUserData());
  }

  List<String> titles = ["Alphabets", "Numbers", "Clothes"];
  List<String> path = [
    "assets/images/abc.png",
    "assets/images/number-blocks.png",
    "assets/images/brand.png"
  ];
  List<Widget> speechCardsNavigate = [
    EnglishAlphabets(),
    NumbersScreen(),
    ClothesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(text: "Home Screen"),
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
        child: GetBuilder<ChildController>(
          init: childcontroller,
          builder: (_) => childcontroller.isloading
              ? AppLoader.spinkit
              : SafeArea(
                  child: Column(
                    children: [
                      20.r.verticalSpace,
                      IntroCard(),
                      20.r.verticalSpace,
                      Container(
                        height: 130.r,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 15.h),
                        child: Column(
                          children: [
                            // 5.r.verticalSpace,
                            Text(
                                textAlign: TextAlign.center,
                                "Autistic individuals are not puzzles. They are complex and wonderful people.",
                                style: AppTextStyle.small.copyWith(
                                  color: Colors.white,
                                )),
                            5.r.verticalSpace,
                            Text(
                                textAlign: TextAlign.center,
                                "Autism is not a disability, it’s a different ability.",
                                style: AppTextStyle.small.copyWith(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      20.r.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              final bottomController2 =
                                  Get.put(bottomController.BottomController());
                              bottomController2.navBarChange(2);
                            },
                            child: Text("Find more",
                                style: AppTextStyle.small.copyWith(
                                    color: AppColors.kWhite, fontSize: 20.r)),
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 270.r,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return speechCards(
                                ontap: () {
                                  Get.to(() => speechCardsNavigate[index]);
                                },
                                title: titles[index],
                                imagePath: path[index],
                              );
                            }),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10.r),
                ),
        ),
      ),
    );
  }
}

Widget speechCards(
    {required String title,
    required String imagePath,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only(right: 10.r),
      // padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
      width: 250.r,
      // height: 250.r,
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
          gradient: const RadialGradient(
            colors: [Color(0xff0E5C9E), Color(0xff031965)],
            focal: Alignment.topCenter,
            radius: .85,
          )),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imagePath,
            scale: 4.8,
          ).paddingOnly(top: 15.r),
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontFamily: "BigBottom", fontSize: 22)),
          15.r.verticalSpace,
          Container(
            width: double.infinity,
            height: 60.r,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.r),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r),
              ),
              gradient: const LinearGradient(
                  colors: [Colors.yellow, Colors.orange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 30,
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Container(
          //         width: 40.r,
          //         height: 40.r,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(100.0),
          //           gradient: const LinearGradient(
          //               colors: [Colors.yellow, Colors.orange],
          //               begin: Alignment.topCenter,
          //               end: Alignment.bottomCenter),
          //         ),
          //         child: const Icon(
          //           Icons.keyboard_arrow_right,
          //           color: Colors.white,
          //           size: 30,
          //         )),
          //   ],
          // ),
        ],
      ),
    ),
  );
}

// body: Column(
//   children: [
//     // Custom app bar

//     30.h.verticalSpace, // Increased space for cleaner design

//     // Child image with shadow for better appearance
//     Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20.r),
//         child: Image.asset(
//           Appassets.child1,
//           height: 250.h,
//           width: double.infinity,
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),

//     30.h.verticalSpace,

//     // Informative text with better spacing, padding, and design
//     Container(
//       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Understanding Autism Spectrum Disorder",
//             style: TextStyle(
//               fontSize: 24.sp,
//               fontWeight: FontWeight.w700,
//               color: kprimaryColor,
//             ),
//           ),
//           10.h.verticalSpace,
//           Text(
//             "Autism Spectrum Disorder (ASD) is a neurodevelopmental condition affecting communication, social interaction, and behavior. People with autism experience the world differently, often struggling with sensory processing and routines.",
//             style: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w400,
//               color: Colors.black.withOpacity(0.7),
//             ),
//           ),
//           10.h.verticalSpace,
//           Text(
//             "While there's no single cause, early intervention and support can significantly improve quality of life.",
//             style: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w400,
//               color: Colors.black.withOpacity(0.7),
//             ),
//           ),
//         ],
//       ),
//     ),

//     30.h.verticalSpace,

//     // Second image with shadow
//     Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20.r),
//         child: Image.asset(
//           Appassets.austism1,
//           height: 250.h,
//           width: double.infinity,
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),

//     30.h.verticalSpace,

//     // Custom button with animation
//     GestureDetector(
//       onTap: () {
//         Get.to(() => AustismDetail());
//       },
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//         width: 0.70.sw,
//         height: 50.h,
//         decoration: BoxDecoration(
//           color: kprimaryColor,
//           borderRadius: BorderRadius.circular(25.r),
//           boxShadow: [
//             BoxShadow(
//               color: kprimaryColor.withOpacity(0.5),
//               blurRadius: 10,
//               offset: Offset(0, 5),
//             ),
//           ],
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           "CLICK HERE",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     ),

//     30.h.verticalSpace,
//   ],
// ).paddingSymmetric(horizontal: 20.w),
