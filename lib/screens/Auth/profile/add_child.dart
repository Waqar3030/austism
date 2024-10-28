import 'package:austism/components/auth_field.dart';
import 'package:austism/components/button.dart';
import 'package:austism/components/primary_button.dart';
import 'package:austism/controller/create_profile_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  TextEditingController emailController = TextEditingController();
  final userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    // Fetch user data when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userController.fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: AppColors.kPrimary,
          )),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(Appassets.background),
            fit: BoxFit.fill,
          ),
        ),
        child: GetBuilder(
            init: userController,
            builder: (controller) {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    children: [
                      30.h.verticalSpace,
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
                                right: 8.w,
                                bottom: 5.h,
                                child: GestureDetector(
                                  onTap: () {
                                    _showImageSourceActionSheet(
                                        context, controller);
                                  },
                                  child: Container(
                                    height: 25.h,
                                    width: 25.w,
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
                      SizedBox(
                        height: 0.03.sh,
                      ),
                      Row(
                        children: [
                          Text(
                            "Set Child Profile",
                            style: TextStyle(
                              color: AppColors.kWhite,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Fill out the Details",
                            style: TextStyle(
                              color: AppColors.kWhite,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      AuthField(
                          title: "Child Name",
                          hintText: "Enter Name",
                          controller: controller.childnameController),
                      // txtfield(
                      //     "Full Name", 1.sw, controller.childnameController),
                      SizedBox(
                        height: 5.h,
                      ),
                      AuthField(
                          title: "Date of Birth",
                          hintText: "Enter Date Birth",
                          controller: controller.dobController),
                      // txtfield("Date of Birth", 1.sw, controller.dobController),
                      SizedBox(
                        height: 5.h,
                      ),
                      AuthField(
                          title: "Gender",
                          hintText: "Enter Gender",
                          controller: controller.genderController),
                      5.h.verticalSpace,
                      AuthField(
                          title: "Guardian Phone Number",
                          hintText: "Enter Number",
                          controller: controller.guardianContactController),
                      // txtfield("Guardian Phone Number", 1.sw,
                      //     controller.guardianContactController),
                      // txtfield("Gender", 1.sw, controller.genderController),
                      SizedBox(
                        height: 5.h,
                      ),
                      PrimaryButton(
                        onTap: () async {
                          if (controller.selectedParentImage != null &&
                              controller.selectedChildImage != null) {
                            controller.parentimage =
                                await controller.uploadImage(
                              selectedImage: controller.selectedParentImage,
                              imageurl: controller.parentimage,
                            );
                            controller.childimage =
                                await controller.uploadImage(
                              selectedImage: controller.selectedChildImage,
                              imageurl: controller.childimage,
                            );
                          } else {
                            if (controller.selectedParentImage != null) {
                              controller.parentimage =
                                  await controller.uploadImage(
                                selectedImage: controller.selectedParentImage,
                                imageurl: controller.parentimage,
                              );
                            }
                            if (controller.selectedChildImage != null) {
                              controller.childimage =
                                  await controller.uploadImage(
                                selectedImage: controller.selectedChildImage,
                                imageurl: controller.childimage,
                              );
                            }
                          }

                          // String? parentImageUrl = await controller.uploadImage(
                          //     selectedImage: controller.selectedParentImage);
                          // String? childImageUrl = await controller.uploadImage(
                          //     selectedImage: controller.selectedChildImage);
                          // if (controller.selectedParentImage != null ||
                          //     controller.selectedChildImage != null) {
                          //   await controller.uploadImage(
                          //       selectedImage: controller.selectedParentImage,
                          //       imageurl: controller.parentimage);
                          //   await controller.uploadImage(
                          //       selectedImage: controller.selectedChildImage,
                          //       imageurl: controller.childimage);
                          // }
                          controller.createUser();
                          Get.to(() => const NavigatorScreen());
                        },
                        text: "Done",
                      ),
                    ],
                  ),
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

  Widget txtfield(String txt, double width, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      width: width,
      child: TextFormField(
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        controller: controller,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: txt,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
    );
  }
}
