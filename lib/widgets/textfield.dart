// import 'package:autistic/Helper/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  final widthh;
  final isPassword;
  final hinttext;
  final hintColor;
  final underlineColor;
  final controller;

  const AuthTextField({
    Key? key,
    required this.underlineColor,
    required this.hintColor,
    this.hinttext,
    required this.widthh,
    required this.isPassword,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        style: TextStyle(color: hintColor),
        cursorColor: Colors.white,
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: 15,
            fontWeight: FontWeight.w200,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
    );
  }
}
