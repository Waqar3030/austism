import 'package:austism/components/primary_button.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/resources/local_storage.dart';
import 'package:austism/screens/Auth/login.dart';
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
          title: const Text(
            'Logout',
            textAlign: TextAlign.center,
            style: TextStyle(color: kprimaryColor),
          ),
          content: const Text(
            'Are you sure you want to \nlogout?',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(
                  onTap: () {
                    Get.back();
                  },
                  text: 'No',
                  width: 0.30.sw,
                ),
                PrimaryButton(
                  width: 0.30.sw,
                  onTap: () {
                    Get.offAll(() => const LoginScreen());
                    LocalStorage.deleteJson(key: lsk.token);
                    LocalStorage.deleteJson(key: lsk.userData);
                  },
                  text: 'Yes',
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
