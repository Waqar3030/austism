import 'package:austism/components/auth_field.dart';
import 'package:austism/controller/create_profile_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditChildProfile extends StatefulWidget {
  const EditChildProfile({super.key});

  @override
  State<EditChildProfile> createState() => _EditChildProfileState();
}

class _EditChildProfileState extends State<EditChildProfile> {
  final userController = Get.put(UserController());
  final childNameController = TextEditingController();
  final genderController = TextEditingController();
  final birthController = TextEditingController();
  final guardianNumController = TextEditingController();
  final parentEmailController = TextEditingController();
  final childLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Edit Child Profile",
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
        child: GetBuilder(
            init: userController,
            builder: (controller) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.r.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 70.r,
                                backgroundImage: controller
                                            .selectedChildImage ==
                                        null
                                    ? const AssetImage(Appassets.parentPic)
                                    : FileImage(controller.selectedChildImage!)
                                        as ImageProvider,
                                backgroundColor: Colors.transparent,
                              ),
                              Positioned(
                                child: GestureDetector(
                                  onTap: () {
                                    _showImageSourceActionSheet(
                                        context, controller);
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      Appassets.camera,
                                      scale: 1.3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      30.r.verticalSpace,
                      AuthField(
                        title: "Child Name",
                        hintText: "Enter Child Name",
                        controller: childNameController,
                      ),
                      10.r.verticalSpace,
                      AuthField(
                        title: "Gender",
                        hintText: "Enter Gender",
                        controller: genderController,
                      ),
                      10.r.verticalSpace,
                      AuthField(
                        title: "Date of Birth",
                        hintText: "Enter Date of Birth",
                        controller: birthController,
                      ),
                      10.r.verticalSpace,
                      AuthField(
                        title: "Guardian Contact",
                        hintText: "Enter Number",
                        controller: guardianNumController,
                      ),
                      10.r.verticalSpace,
                      AuthField(
                        title: "Parent Email",
                        hintText: "Enter Email",
                        controller: parentEmailController,
                      ),
                      10.r.verticalSpace,
                      AuthField(
                        title: "Child Location",
                        hintText: "Enter Child Location",
                        controller: childLocationController,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10.r),
                ),
              );
            }),
      ),
    );
  }

  void _showImageSourceActionSheet(
      BuildContext context, UserController userController) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.of(context).pop();
                userController.pickChildImage(
                  source: ImageSource.camera,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                userController.pickChildImage(
                  source: ImageSource.gallery,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
