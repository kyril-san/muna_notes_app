// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextstyle {
  static final nunitoLightwhite = GoogleFonts.nunito(
      textStyle: TextStyle(
          color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w300));

  static final nunitoSemiBoldwhite = GoogleFonts.nunito(
      textStyle: TextStyle(
          color: Colors.white, fontSize: 43.sp, fontWeight: FontWeight.w600));

  static final nunitoRegularwhite = GoogleFonts.nunito(
      textStyle: TextStyle(
          color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.w600));

  static final nunitolightblack = GoogleFonts.nunito(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w400));

  static final nunitoRegularblack = GoogleFonts.nunito(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.w400));

  static final nunitosmallgrey = GoogleFonts.nunito(
      textStyle: TextStyle(
          color: Color.fromARGB(255, 154, 154, 154),
          fontSize: 18.sp,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600));

  static final nunitoLightgrey = GoogleFonts.nunito(
      textStyle: TextStyle(
          color: Color.fromARGB(255, 154, 154, 154),
          fontSize: 20.sp,
          fontWeight: FontWeight.w600));

  static final nunitoTitlegrey = GoogleFonts.nunito(
      textStyle: TextStyle(
          color: Color.fromARGB(255, 154, 154, 154),
          fontSize: 48.sp,
          fontWeight: FontWeight.w400));

  static final nunitoRegulargrey = GoogleFonts.nunito(
      textStyle: TextStyle(
          color: Color.fromARGB(255, 154, 154, 154),
          fontSize: 23.sp,
          fontWeight: FontWeight.w400));
}
