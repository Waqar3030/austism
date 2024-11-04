import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgotPassController extends GetxController {
  TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  void loader(bool value) {
    isLoading = value;
    update();
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void forgotPassword() async {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter your email address",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    try {
      loader(true);
      log("Attempting to send password reset email to: ${emailController.text.trim()}");

      await firebaseAuth.sendPasswordResetEmail(
          email: emailController.text.trim());

      Fluttertoast.showToast(
        msg: "Password reset email sent! Please check your email.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Get.close(1);
    } on FirebaseAuthException catch (e) {
      log("Password reset failed: ${e.message}");
      String errorMessage = "Failed to send reset email. Please try again.";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      }

      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (error) {
      log("An unexpected error occurred: $error");
      Fluttertoast.showToast(
        msg: "An unexpected error occurred. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      loader(false);
    }
  }
}
