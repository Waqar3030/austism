import 'dart:async';
import 'dart:developer';
import 'package:austism/controller/child_controller.dart';
import 'package:austism/resources/local_storage.dart';
import 'package:austism/screens/Auth/navigator.dart';
import 'package:austism/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final childcontroller = Get.put(ChildController());

  @override
  void initState() {
    super.initState();
    var user = LocalStorage.readJson(key: lsk.userData);

    if (user != null) {
      childcontroller.fetchUserData(user: user);
      log("User logged in: $user");
      Timer(Duration(seconds: 3),
          () => Get.offAll(() => const NavigatorScreen()));
    } else {
      log("User logged in: $user");

      Timer(Duration(seconds: 3), () => Get.offAll(() => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            // image: AssetImage(Appassets.splash),
            image: AssetImage("assets/images/178.png"),
            filterQuality: FilterQuality.low,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/app_icon.png"),
              scale: 3.8,
            ),
          ),
        ),
      ),
    );
  }
}
