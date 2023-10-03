// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/general_colors.dart';
import 'package:muna_notes_app/const/text_style.dart';

appTextfield(BuildContext context,
    {String? hint, IconData? icon, IconData? suffixicon}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.w),
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    height: 50.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.r),
      color: Colors.white,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.blackcolor,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: TextFormField(
            cursorColor: AppColors.blackcolor,
            style: AppTextstyle.nunitolightblack,
            decoration: InputDecoration(
                // focusedBorder: InputBorder.none,
                hintText: hint,
                hintStyle: AppTextstyle.nunitosmallgrey,
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    suffixicon,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                )),
          ),
        ),
      ],
    ),
  );
}

appActionButtion(BuildContext context, {String text = '', Function()? func}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greycolor,
        fixedSize: Size(370.w, 50.h),
        // padding: EdgeInsets.symmetric(horizontal: 50.w),
        shape: StadiumBorder()),
    onPressed: func,
    child: Text(
      text,
      style: AppTextstyle.nunitolightblack,
    ),
  );
}
