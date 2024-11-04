import 'dart:developer';
import 'package:austism/controller/child_controller.dart';
import 'package:austism/screens/Auth/navigator.dart';
import 'package:austism/screens/Auth/email_verification_screen.dart';
import 'package:austism/screens/Auth/profile/create_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

final ChildController childcontroller = Get.put(ChildController());

class AuthController extends GetxController {
  bool fromemail = true;
  setsignupType(bool type) {
    fromemail = type;
    update();
  }

  bool isLoading = false;

  void loader(bool value) {
    isLoading = value;
    update();
  }

  static AuthController instance = Get.find();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    firebaseUser.bindStream(firebaseAuth.userChanges());
  }

  // Register with email and password
  void register(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Email and Password cannot be empty",
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
      // Create a new user with email and password
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // Set the firebaseUser to the currently logged-in user
      firebaseUser.value = firebaseAuth.currentUser;

      // Send email verification
      await firebaseUser.value?.sendEmailVerification();

      // Notify user about verification email sent
      Fluttertoast.showToast(
        msg:
            "A verification email has been sent to your email address. Please verify before logging in.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      // Navigate to OTP screen (email verification screen in this case)
      Get.to(() => EmailVerificationScreen());
    } catch (firebaseAuthException) {
      log("Registration failed: ${firebaseAuthException.toString()}");
      Fluttertoast.showToast(
        msg: "Registration failed. Please try again.",
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

  // Verify email status and allow login
  void verifyEmail() async {
    try {
      await firebaseUser.value?.reload();
      if (firebaseUser.value?.emailVerified == true) {
        Fluttertoast.showToast(
          msg: "Email verified successfully. You can now log in.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.to(() => const CreateProfileScreen());
      } else {
        Fluttertoast.showToast(
          msg: "Please verify your email before logging in.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      log("Email verification check failed: $e");
      Fluttertoast.showToast(
        msg: "Email verification check failed. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  // Login the user using email and password
  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Email or Password cannot be empty",
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
      // Login the user with email and password
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      // Set the firebaseUser to the currently logged-in user
      firebaseUser.value = firebaseAuth.currentUser;

      // Check if the email is verified
      if (firebaseUser.value?.emailVerified == true) {
        Get.to(() => const NavigatorScreen()); // Navigate to the next screen
        //
        childcontroller.fetchUserData();
      } else {
        Fluttertoast.showToast(
          msg: "Please verify your email before logging in.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (firebaseAuthException) {
      log("Login failed: ${firebaseAuthException.toString()}");
      Fluttertoast.showToast(
        msg: "Login failed. Please check your credentials.",
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

  // Forgot Password
  void forgotPassword(String email) async {
    if (email.isEmpty) {
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
      await firebaseAuth.sendPasswordResetEmail(email: email.trim());
      Fluttertoast.showToast(
        msg: "Password reset email sent! Please check your email.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // Optionally, you could navigate to a confirmation screen
    } catch (firebaseAuthException) {
      log("Password reset failed: ${firebaseAuthException.toString()}");
      Fluttertoast.showToast(
        msg: "Failed to send reset email. Please try again.",
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
