// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showErrorDialog(BuildContext context, {String? text}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          title: Text('Error'),
          content: Text(
            text!,
            textAlign: TextAlign.center,
          ),
        );
      });
}
