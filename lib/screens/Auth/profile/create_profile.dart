import 'package:austism/components/auth_field.dart';
import 'package:austism/components/button.dart';
import 'package:austism/components/primary_button.dart';
import 'package:austism/controller/create_profile_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/profile/add_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final userController = Get.put(UserController());

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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Appassets.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                GetBuilder(
                  init: userController,
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 70.r,
                              // backgroundImage: AssetImage(Appassets
                              //     .parentPic), // Adjust the size as needed
                              backgroundImage: controller.selectedParentImage ==
                                      null
                                  ? const AssetImage(Appassets.parentPic)
                                  : FileImage(controller.selectedParentImage!),
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
                    );
                  },
                ),
                SizedBox(height: 0.03.sh),
                Row(
                  children: [
                    Text(
                      "Set Parent Profile",
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
                SizedBox(height: 0.05.sh),
                AuthField(
                    title: "Parent Name",
                    hintText: "Enter Name",
                    controller: userController.parentnameController),
                // txtfield(
                //     "Full Name", 1.sw, userController.parentnameController),
                SizedBox(height: 5.h),
                AuthField(
                    title: "Location",
                    hintText: "Enter Location",
                    controller: userController.parentlocController),
                // txtfield("Location", 1.sw, userController.parentlocController),
                SizedBox(height: 5.h),
                AuthField(
                    title: "Contact",
                    hintText: "Enter Contact Number",
                    controller: userController.parentcontactController),
                // txtfield("Contact Info", 1.sw,
                //     userController.parentcontactController),
                SizedBox(height: 5.h),
                AuthField(
                    title: "Email",
                    hintText: "Enter Email",
                    controller: userController.parentemailController),
                // txtfield("Email", 1.sw, userController.parentemailController),
                SizedBox(height: 50.h),
                GetBuilder(
                  init: userController,
                  builder: (controller) {
                    return controller.isloading
                        ? const Center(child: CircularProgressIndicator())
                        : PrimaryButton(
                            onTap: () async {
                              Get.to(() => const AddChildScreen());
                            },
                            text: "Continue",
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showImageSourceActionSheet(
      BuildContext context, UserController controller) {
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
                controller.pickParentImage(source: ImageSource.camera);
                controller.update();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                controller.pickParentImage(source: ImageSource.gallery);
                controller.update();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget txtfield(String txt, double width, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
            borderRadius: BorderRadius.circular(15.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
    );
  }
}
