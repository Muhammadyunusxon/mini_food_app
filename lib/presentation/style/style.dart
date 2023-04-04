
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Style {
  Style._();

  static const Color primaryColor = const Color(0xfff4f4f4);
  static const Color primaryDarkColor = const Color(0xfff4f4f4);
  static const Color black = const Color(0xff000000);
  static const Color white = const Color(0xffffffff);
  static const Color textColor =  Colors.grey;
  static const Color transparent =  Colors.transparent;

  static regular({int size = 16, Color color = textColor}) {
    return GoogleFonts.inter(
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static normal({int size = 16, Color color = textColor}) {
    return GoogleFonts.inter(
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.normal,
    );
  }


  static bold({int size = 16, Color color = textColor}) {
    return GoogleFonts.inter(
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }
}
