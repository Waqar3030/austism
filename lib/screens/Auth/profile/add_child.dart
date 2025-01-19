import 'package:austism/components/auth_field.dart';
import 'package:austism/components/primary_button.dart';
import 'package:austism/controller/create_profile_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/app_loader.dart';
import 'package:austism/resources/apptext.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  TextEditingController emailController = TextEditingController();
  final userController = Get.put(UserController());
  DateTime? _selectedDate;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        userController.dobController.text =
            DateFormat('dd-MM-yyyy').format(_selectedDate!);
      });
    }
  }

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
        child: GetBuilder<UserController>(
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
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            "Date of Birth",
                            style: AppTextStyle.small.copyWith(
                              color: AppColors.kWhite,
                              fontSize: 14.sp,
                            ),
                          ).paddingOnly(left: 20.r, bottom: 5.r),
                        ],
                      ),
                      TextFormField(
                        onTap: () {
                          _selectDate(context);
                        },
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        controller: controller.dobController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            fillColor: const Color(0xFFF6F6F6),
                            filled: true,
                            hintText: "Enter Date of Birth",
                            hintStyle:
                                const TextStyle(color: AppColors.kGrey60),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD1A661)),
                              borderRadius: BorderRadius.circular(15.r),
                            )),
                      ),
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
                          controller: controller.guardianContactController,
                          keyboardType: TextInputType.phone),
                      5.h.verticalSpace,
                      AuthField(
                          title: "Child Location",
                          hintText: "Enter Location",
                          controller: controller.childLocation),
                      SizedBox(
                        height: 5.h,
                      ),
                      userController.isLoading
                          ? AppLoader.spinkit
                          : PrimaryButton(
                              onTap: () async {
                                controller.setLoading(true);

                                if (controller.selectedParentImage != null &&
                                    controller.selectedChildImage != null) {
                                  controller.parentimage =
                                      await controller.uploadImage(
                                    selectedImage:
                                        controller.selectedParentImage,
                                    imageurl: controller.parentimage,
                                  );
                                  controller.childimage =
                                      await controller.uploadImage(
                                    selectedImage:
                                        controller.selectedChildImage,
                                    imageurl: controller.childimage,
                                  );
                                } else {
                                  if (controller.selectedParentImage != null) {
                                    controller.parentimage =
                                        await controller.uploadImage(
                                      selectedImage:
                                          controller.selectedParentImage,
                                      imageurl: controller.parentimage,
                                    );
                                  }
                                  if (controller.selectedChildImage != null) {
                                    controller.childimage =
                                        await controller.uploadImage(
                                      selectedImage:
                                          controller.selectedChildImage,
                                      imageurl: controller.childimage,
                                    );
                                  }
                                }

                                controller.createUser();
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
}
