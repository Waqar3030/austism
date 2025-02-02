import 'package:austism/components/drawer.dart';
import 'package:austism/controller/child_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/app_loader.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/profile/edit_child_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChildProfile extends StatefulWidget {
  const ChildProfile({super.key});

  @override
  State<ChildProfile> createState() => _ChildProfileState();
}

class _ChildProfileState extends State<ChildProfile> {
  final ChildController childcontroller = Get.put(ChildController());

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => childcontroller.fetchUserData()); // Fetch user data on init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            title: Text(
              "Child Profile",
              style: AppTextStyle.medium.copyWith(
                color: Colors.indigo[700]!,
                fontWeight: FontWeight.w800,
                fontSize: 24.sp,
              ),
            ),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Get.to(() => const DrawerScreen());
              },
              child: Image.asset(
                "assets/images/Menu.png",
                scale: 3.5,
                color: Colors.indigo[700]!,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.to(() => EditChildProfile(
                            name: childcontroller.childname,
                            gender: childcontroller.gender,
                            birth: childcontroller.dob,
                            guardianNum: childcontroller.guardianContact,
                            parentEmail: childcontroller.parentemail,
                            childLocation: childcontroller.childloc,
                            imageUrl: childcontroller.childimage,
                          ))!
                      .whenComplete(
                    () => childcontroller.fetchUserData(),
                  );
                },
                child: Image.asset(
                  "assets/images/Frame 11577.png",
                  scale: 4.5,
                ),
              )
            ],
          ).paddingOnly(right: 10.r),
        ),
        body: GetBuilder(
            init: childcontroller,
            builder: (controller) {
              if (controller.isloading) {
                return Center(child: AppLoader.spinkit);
              }

              return Container(
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
                  child: Column(
                    children: [
                      15.r.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 70.r,
                            backgroundImage: controller.childimage.isNotEmpty
                                ? NetworkImage(controller
                                    .childimage) // Use parent image URL
                                : const AssetImage("assets/images/user.png")
                                    as ImageProvider,
                          )
                        ],
                      ),
                      20.r.verticalSpace,
                      Text(
                        controller.childname.isNotEmpty
                            ? controller.childname
                            : "Child Name",
                        style: AppTextStyle.medium.copyWith(
                            fontSize: 25.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      20.r.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.r, vertical: 10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: kprimaryColor),
                        ),
                        child: Column(
                          children: [
                            _buildInfoRow("Name", controller.childname),
                            _buildDivider(),
                            _buildInfoRow("Gender", controller.gender),
                            _buildDivider(),
                            _buildInfoRow("Date of Birth", controller.dob),
                            _buildDivider(),
                            _buildInfoRow(
                                "Guardian Contact", controller.guardianContact),
                            _buildDivider(),
                            _buildInfoRow("Parent Name", controller.parentname),
                            _buildDivider(),
                            _buildInfoRow(
                                "Parent Email", controller.parentemail),
                            _buildDivider(),
                            _buildInfoRow(
                                "Child Location", controller.childloc),
                          ],
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10.r),
                ),
              );
            }));
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.medium.copyWith(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value.isNotEmpty ? value : "N/A",
          style: AppTextStyle.small.copyWith(
            fontSize: 14.sp,
            color: AppColors.kWhite,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.shade500,
      thickness: 1.0,
    );
  }
}
