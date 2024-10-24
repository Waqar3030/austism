import 'package:austism/components/textfield_two.dart';
import 'package:austism/controller/create_profile_controller.dart';
import 'package:austism/resources/appAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';

class EditChildProfile extends StatefulWidget {
  const EditChildProfile({super.key});

  @override
  State<EditChildProfile> createState() => _EditChildProfileState();
}

class _EditChildProfileState extends State<EditChildProfile> {
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Child Profile'),
      ),
      body: GetBuilder(
          init: userController,
          builder: (controller) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            radius: 60.r,
                            backgroundImage:
                                controller.selectedChildImage == null
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
                  30.h.verticalSpace,
                  TextfieldTwo(
                    labelText: " Child Name",
                    controller: controller.childnameController,
                    hintText: "Enter Child Name",
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            );
          }),
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
