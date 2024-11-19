import 'dart:io';

import 'package:austism/components/primary_button.dart';
import 'package:austism/components/appBar.dart';
import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/local_storage.dart';
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
          contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
          insetPadding: EdgeInsets.symmetric(horizontal: 15.r),
          title: Text("Create Schedule"),
          content: SizedBox(
            height: 340.r,
            width: 400.r,
            child: SingleChildScrollView(
              child: StatefulBuilder(builder: (context, _setState) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        imageFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        _setState(
                            () {}); // Refresh the dialog to show image preview
                      },
                      child: imageFile != null
                          ? Image.file(
                              File(imageFile!.path),
                              height: 100.r,
                              width: 150.r,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 100.r,
                              width: 150.r,
                              color: Colors.grey[200],
                              child: Icon(Icons.add_a_photo),
                            ),
                    ),
                    SizedBox(height: 10.r),
                    TextField(
                      controller: dateController,
                      readOnly: true,
                      decoration: InputDecoration(labelText: "Select Date"),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          dateController.text =
                              "${selectedDate.toLocal()}".split(' ')[0];
                        }
                      },
                    ),
                    SizedBox(height: 10.r),
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
                    SizedBox(height: 10.r),
                    TextField(
                      maxLines: 2,
                      controller: routineController,
                      decoration: InputDecoration(labelText: "Enter Routine"),
                    ),
                    SizedBox(height: 10.r),
                  ],
                );
              }),
            ),
          ),
          actions: [
            PrimaryButton(
                height: 40.r,
                width: 100.r,
                onTap: () {
                  Get.back();
                },
                text: "Cancel"),
            PrimaryButton(
                height: 40.r,
                width: 100.r,
                onTap: () {
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
                text: "Save"),
            // ElevatedButton(
            //   onPressed: () {
            //     if (imageFile != null &&
            //         dateController.text.isNotEmpty &&
            //         timeController.text.isNotEmpty &&
            //         routineController.text.isNotEmpty) {
            //       scheduleController.addSchedule(
            //           imageFile!,
            //           dateController.text,
            //           timeController.text,
            //           routineController.text);
            //       Navigator.of(context).pop(); // Close dialog after saving
            //     }
            //   },
            //   child: Text("Save"),
            // ),
          ],
        );
      },
    );
  }

  void _deleteSchedule(int index) {
    scheduleController.removeSchedule(index);
  }

  @override
  void initState() {
    super.initState();
    print(LocalStorage.readJson(key: lsk.scheduleList));
    Future.microtask(() async {
      List dataList = LocalStorage.readJsonList(key: lsk.scheduleList) ?? [];

      for (var schedule in dataList) {
        scheduleController.schedules = schedule;
        scheduleController.update();
      }
      setState(() {});
    });
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
          child: SingleChildScrollView(
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
                GetBuilder(
                    init: scheduleController,
                    builder: (controller) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.schedules.length,
                        itemBuilder: (context, index) {
                          var scheduless = controller.schedules[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.r, horizontal: 16.r),
                            child: Container(
                              width: 0.85.sw,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.r, vertical: 16.r),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6.r,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Image section
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: Image.file(
                                          File(scheduless["image"]),
                                          height: 80.r,
                                          width: 80.r,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 16.r),

                                      // Text section
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            scheduless["routine"],
                                            style: TextStyle(
                                              color: Color(0xff121137),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22.sp,
                                            ),
                                          ),
                                          SizedBox(height: 8.r),
                                          Text(
                                            scheduless["date"],
                                            style: TextStyle(
                                              color: Color(0xff121137),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                          SizedBox(height: 4.r),
                                          Text(
                                            scheduless["time"],
                                            style: TextStyle(
                                              color: Color(0xff757575),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.indigo[700]!,
                                    ),
                                    onPressed: () => _deleteSchedule(index),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                SizedBox(height: 20), // Add space above the button if needed
                PrimaryButton(
                  onTap: _openCreateScheduleDialog,
                  text: "Create Schedule",
                ),
              ],
            ).paddingSymmetric(horizontal: 14.w),
          ),
        ),
      ),
    );
  }
}

class ScheduleController extends GetxController {
  // List to store schedules
  List schedules = [];

  // Method to add a new schedule
  void addSchedule(
      XFile imageFile, String date, String time, String routine) async {
    schedules.add({
      "image": imageFile.path,
      "date": date,
      "time": time,
      "routine": routine,
    });
    update();

    LocalStorage.saveJson(key: lsk.scheduleList, value: [schedules]);
  }

  void removeSchedule(int index) {
    schedules.removeAt(index);
    update();
  }
}
