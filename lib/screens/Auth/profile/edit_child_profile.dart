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

class EditChildProfile extends StatefulWidget {
  final String name,
      imageUrl,
      gender,
      birth,
      guardianNum,
      parentEmail,
      childLocation;
  const EditChildProfile(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.gender,
      required this.birth,
      required this.guardianNum,
      required this.parentEmail,
      required this.childLocation});

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
        birthController.text = DateFormat('dd-MM-yyyy').format(_selectedDate!);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      childNameController.text = widget.name;
      genderController.text = widget.gender;
      birthController.text = widget.birth;
      guardianNumController.text = widget.guardianNum;
      parentEmailController.text = widget.parentEmail;
      childLocationController.text = widget.childLocation;
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
        centerTitle: true,
        title: Text(
          "Edit Child Profile",
          style: AppTextStyle.medium.copyWith(
            color: Colors.indigo[700]!,
            fontWeight: FontWeight.w800,
            fontSize: 24.sp,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.keyboard_backspace_sharp,
              color: Colors.indigo[700]!,
              size: 30.sp,
            )),
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
                                            .selectedChildImage !=
                                        null
                                    ? FileImage(controller.selectedChildImage!)
                                    : NetworkImage(widget.imageUrl)
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            "Date of Birth bbb",
                            style: AppTextStyle.small.copyWith(
                              color: AppColors.kWhite,
                              fontSize: 14.sp,
                            ),
                          ).paddingOnly(left: 20.r, bottom: 5.r),
                        ],
                      ),
                      Container(
                        child: TextFormField(
                          onTap: () {
                            _selectDate(context);
                          },
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          controller: birthController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              fillColor: const Color(0xFFF6F6F6),
                              filled: true,
                              hintText: birthController.text,
                              hintStyle:
                                  const TextStyle(color: AppColors.kGrey60),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFD1A661)),
                                borderRadius: BorderRadius.circular(15.r),
                              )),
                        ),
                      ),
                      // AuthField(
                      //   title: "Date of Birth",
                      //   hintText: "Enter Date of Birth",
                      //   controller: birthController,
                      // ),
                      10.r.verticalSpace,
                      AuthField(
                        title: "Guardian Contact",
                        hintText: "Enter Number",
                        controller: guardianNumController,
                        keyboardType: TextInputType.phone,
                      ),
                      // 10.r.verticalSpace,
                      // AuthField(
                      //   title: "Parent Email",
                      //   hintText: "Enter Email",
                      //   controller: parentEmailController,
                      // ),
                      10.r.verticalSpace,
                      AuthField(
                        title: "Child Location",
                        hintText: "Enter Child Location",
                        controller: childLocationController,
                      ),
                      20.r.verticalSpace,
                      GetBuilder(
                          init: userController,
                          builder: (controller) {
                            return controller.isLoading
                                ? AppLoader.spinkit
                                : PrimaryButton(
                                    onTap: () {
                                      userController.updateUser(
                                        name: childNameController.text,
                                        location: childLocationController.text,
                                        contactInfo: guardianNumController.text,
                                        email: parentEmailController.text,
                                        childName: childNameController.text,
                                        dob: birthController.text,
                                        guardianContact:
                                            guardianNumController.text,
                                        gender: genderController.text,
                                        image: widget.imageUrl,
                                      );
                                    },
                                    text: "Update");
                          }),
                      10.r.verticalSpace,
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
