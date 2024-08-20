import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/login.dart';
import 'package:austism/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDialogbox {
  // Function to show the logout dialog
  static void logout(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Set to true if you want the dialog to be dismissible by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Logout',
            textAlign: TextAlign.center,
            style: TextStyle(color: kprimaryColor),
          ),
          content: Text(
            'Are you sure you want to \nlogout?',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: CustomButton(
                    textButton: "No",
                    textColor: Colors.white,
                    widthh: 0.30.sw,
                    isIcon: false,
                    isBorder: true,
                    buttonColor: kprimaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.close(2);
                    Get.to(() => LoginScreen());
                  },
                  child: CustomButton(
                    textButton: "Yes",
                    textColor: Colors.white,
                    widthh: 0.30.sw,
                    isIcon: false,
                    isBorder: true,
                    buttonColor: kprimaryColor,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
