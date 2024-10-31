import 'dart:io';

import 'package:austism/components/primary_button.dart';
import 'package:austism/components/appBar.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VisualScreen extends StatefulWidget {
  const VisualScreen({super.key});

  @override
  State<VisualScreen> createState() => _VisualScreenState();
}

class _VisualScreenState extends State<VisualScreen> {
  final ScheduleController scheduleController = Get.put(ScheduleController());

  void _openCreateScheduleDialog() {
    final TextEditingController timeController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController routineController = TextEditingController();
    XFile? imageFile;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Create Schedule"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () async {
                  imageFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  setState(() {}); // Refresh the dialog to show image preview
                },
                child: imageFile != null
                    ? Image.file(
                        File(imageFile!.path),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey[200],
                        child: Icon(Icons.add_a_photo),
                      ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(labelText: "Select Date"),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    dateController.text =
                        "${selectedDate.toLocal()}".split(' ')[0];
                  }
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: timeController,
                readOnly: true,
                decoration: InputDecoration(labelText: "Select Time"),
                onTap: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    timeController.text = selectedTime.format(context);
                  }
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: routineController,
                decoration: InputDecoration(labelText: "Enter Routine"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog without saving
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (imageFile != null &&
                    dateController.text.isNotEmpty &&
                    timeController.text.isNotEmpty &&
                    routineController.text.isNotEmpty) {
                  scheduleController.addSchedule(
                      imageFile!,
                      dateController.text,
                      timeController.text,
                      routineController.text);
                  Navigator.of(context).pop(); // Close dialog after saving
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: "Visual Schedule",
          )),
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
        child: SafeArea(
          child: Column(
            children: [
              30.r.verticalSpace,
              Row(
                children: [
                  Text(
                    "My Schedule",
                    style: AppTextStyle.medium.copyWith(
                      color: AppColors.kWhite,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              20.r.verticalSpace,
              Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: scheduleController.schedules.length,
                      itemBuilder: (context, index) {
                        final schedule = scheduleController.schedules[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.r),
                          child: Container(
                            width: 0.8.sw,
                            padding: EdgeInsets.symmetric(horizontal: 10.r),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Image.file(
                                  File(schedule["image"]!.path),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  schedule["date"],
                                  style: TextStyle(
                                    color: Color(0xff121137),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  schedule["time"],
                                  style: TextStyle(
                                    color: Color(0xff121137),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  schedule["routine"],
                                  style: TextStyle(
                                    color: Color(0xff121137),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
              PrimaryButton(
                onTap: _openCreateScheduleDialog,
                text: "Create Schedule",
              ),
            ],
          ).paddingSymmetric(horizontal: 14.w),
        ),
      ),
    );
  }
}

class ScheduleController extends GetxController {
  // List to store schedules
  var schedules = <Map<String, dynamic>>[].obs;

  // Method to add a new schedule
  void addSchedule(XFile imageFile, String date, String time, String routine) {
    schedules.add({
      "image": imageFile,
      "date": date,
      "time": time,
      "routine": routine,
    });
  }
}
