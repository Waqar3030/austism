import 'package:austism/components/button.dart';
import 'package:austism/controller/create_profile_controller.dart';
import 'package:austism/resources/appAssets.dart';
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
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: bprimaryColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Get.back();
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
                  Appassets.arrowback,
                  scale: 1.5,
                  color: kprimaryColor,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 0.07.sh),
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
                              radius: 100.r,
                              // backgroundImage: AssetImage(Appassets
                              //     .parentPic), // Adjust the size as needed
                              backgroundImage: controller.selectedParentImage ==
                                      null
                                  ? const AssetImage(Appassets.parentPic)
                                  : FileImage(controller.selectedParentImage!),
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
                    );
                  },
                ),
                SizedBox(height: 0.03.sh),
                Row(
                  children: [
                    Text(
                      "Set Parent Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.sp,
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
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.05.sh),
                txtfield("Full Name", 1.sw, userController.nameController),
                SizedBox(height: 5.h),
                txtfield("Location", 1.sw, userController.parentlocController),
                SizedBox(height: 5.h),
                txtfield("Contact Info", 1.sw,
                    userController.parentcontactController),
                SizedBox(height: 5.h),
                txtfield("Email", 1.sw, userController.parentemailController),
                SizedBox(height: 50.h),
                GetBuilder(
                  init: userController,
                  builder: (controller) {
                    return controller.isloading
                        ? const Center(child: CircularProgressIndicator())
                        : GestureDetector(
                            onTap: () async {
                              Get.to(() => const AddChildScreen());
                            },
                            child: CustomButton(
                              textButton: "CONTINUE",
                              textColor: Colors.white,
                              widthh: 1.sw,
                              isIcon: false,
                              isBorder: false,
                              buttonColor: kprimaryColor,
                            ),
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
                controller.pickImage(
                    selectedImage: controller.selectedParentImage,
                    source: ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                controller.pickImage(
                    selectedImage: controller.selectedParentImage,
                    source: ImageSource.gallery);
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
