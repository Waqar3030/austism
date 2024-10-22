import 'package:austism/components/drawer.dart';
import 'package:austism/controller/child_controller.dart';
import 'package:austism/resources/appAssets.dart';
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
    childcontroller.fetchUserData(); // Fetch user data on init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Child Profile",
            style: TextStyle(
              color: greenColor,
              fontWeight: FontWeight.w800,
              fontSize: 35.sp,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.to(() => const DrawerScreen());
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
                  "assets/images/Menu.png",
                  scale: 2.0,
                  // color: kprimaryColor,
                ),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => EditChildProfile());
              },
              child: Image.asset(
                "assets/images/edit_profile.png",
                scale: 3.5,
              ),
            )
          ],
        ),
        body: GetBuilder(
            init: childcontroller,
            builder: (controller) {
              if (controller.isloading) {
                return Center(child: CircularProgressIndicator());
              }

              return SafeArea(
                child: Column(
                  children: [
                    15.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80.r,
                          backgroundImage: controller.parentimage.isNotEmpty
                              ? NetworkImage(controller
                                  .parentimage) // Use parent image URL
                              : const AssetImage(Appassets.parentPic)
                                  as ImageProvider,
                        )
                      ],
                    ),
                    20.h.verticalSpace,
                    Text(
                      controller.childname.isNotEmpty
                          ? controller.childname
                          : "Child Name",
                      style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      controller.parentloc.isNotEmpty
                          ? controller.parentloc
                          : "Location",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    20.h.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
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
                              "Parent Contact", controller.parentcontact),
                          _buildDivider(),
                          _buildInfoRow("Parent Email", controller.parentemail),
                          _buildDivider(),
                          _buildInfoRow(
                              "Parent Location", controller.parentloc),
                          // Add more fields as needed
                        ],
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 15.w),
              );
            }));
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 28.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value.isNotEmpty ? value : "N/A", // Display "N/A" if value is empty
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey.shade500, thickness: 1.0);
  }
}
