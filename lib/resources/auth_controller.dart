import 'dart:developer';

import 'package:austism/screens/Auth/navigator.dart';
import 'package:austism/screens/Auth/otp1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  // Initialize FirebaseAuth instance
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();

    firebaseUser = Rx<User?>(firebaseAuth.currentUser);

    firebaseUser.bindStream(firebaseAuth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
  }

  // _setInitialScreen(User? user) {
  //   if (user == null) {
  //     Get.offAll(() => const SignUp());
  //   } else {
  //     Get.offAll(() => const HomeScreen());
  //   }
  // }

  void register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email.toString(), password: password.toString());
      Get.to(() => const OTPScreen1());
    } catch (firebaseAuthException) {
      log(firebaseAuthException.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.to(() => NavigatorScreen());
    } catch (firebaseAuthException) {
      log(firebaseAuthException.toString());
    }
  }
}
