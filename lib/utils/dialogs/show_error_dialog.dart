import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showErrorDialog(BuildContext context, {required String text}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          title: const Text('Error'),
          content: Text(
            text,
            textAlign: TextAlign.center,
          ),
        );
      });
}
