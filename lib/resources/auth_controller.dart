import 'dart:developer';
import 'package:austism/screens/Auth/navigator.dart';
import 'package:austism/screens/Auth/otp1.dart';
import 'package:austism/screens/Auth/profile/create_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    firebaseUser.bindStream(firebaseAuth.userChanges());
  }

  // Register a new user with email and password and send OTP for phone verification
  void register(String email, String password, String phoneNumber) async {
    if (email.isEmpty || password.isEmpty || phoneNumber.isEmpty) {
      Fluttertoast.showToast(
        msg: "Email, Password, or Phone number cannot be empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    try {
      // Create a new user with email and password
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );

      // After successful registration, send OTP to the user's phone number
      sendOTP(phoneNumber);
    } catch (firebaseAuthException) {
      log(firebaseAuthException.toString());
      Fluttertoast.showToast(
        msg: "Registration failed. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  // Send OTP to the user's phone number for verification
  void sendOTP(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-verification of phone number
        await FirebaseAuth.instance.signInWithCredential(credential);
        Fluttertoast.showToast(msg: "Phone number automatically verified");
        Get.to(() => const SetProfileScreen()); // Navigate to next screen
      },
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(msg: e.message ?? "Verification failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        // Navigate to OTP screen after the code is sent
        Get.to(() => OTPScreen1(
            verificationId:
                verificationId)); // Pass verificationId to OTP screen
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout for auto-retrieval
      },
      timeout:
          const Duration(seconds: 60), // Timeout duration for auto-retrieval
    );
  }

  // Login the user using email and password
  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Email or Password cannot be empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    try {
      // Login the user with email and password
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.to(() =>
          const NavigatorScreen()); // Navigate to the next screen on successful login
    } catch (firebaseAuthException) {
      log(firebaseAuthException.toString());
      Fluttertoast.showToast(
        msg: "Login failed. Please check your credentials.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
