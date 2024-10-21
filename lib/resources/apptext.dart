import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  dynamic fontSize;
  static TextStyle get heading => GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get medium =>
      GoogleFonts.poppins(fontSize: 28.sp, fontWeight: FontWeight.w500);
  static TextStyle get small =>
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400);
}
