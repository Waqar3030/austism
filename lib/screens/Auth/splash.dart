import 'dart:async';
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
  void initState() {
    super.initState();
    print('run');
    Timer(Duration(seconds: 3), () => Get.offAll(() => const LoginScreen()));
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
            image: AssetImage("assets/images/file.png"),
            fit: BoxFit.fill,
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
