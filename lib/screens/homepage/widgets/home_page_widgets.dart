// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/service/cloud/cloud_note.dart';

Future<void> showcontentdialog(BuildContext context,
    {required TextEditingController controller1,
    required TextEditingController controller2,
    required Function()? okfunction,
    String? text}) {
  final option = showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add A New Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              notesTextformfield(
                controller: controller1,
                hintText: 'Add your Title',
              ),
              SizedBox(height: 10.h),
              notesTextformfield(
                controller: controller2,
                hintText: 'Add your Description',
                content: true,
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
            TextButton(onPressed: okfunction, child: Text('Ok')),
          ],
        );
      });
  return option;
}

notesTextformfield(
    {required TextEditingController controller,
    String? hintText,
    bool content = false}) {
  return TextFormField(
    controller: controller,
    maxLines: content ? 4 : 1,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
  );
}

emptynotes(BuildContext context) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/empty_background.png',
          fit: BoxFit.contain,
        ),
        Text(
          'Create your First Note!',
          style: AppTextstyle.nunitoLightwhite,
        )
      ],
    ),
  );
}

notesList(BuildContext context, {required Iterable<CloudNote> notes}) {
  return ListView.builder(
    itemCount: notes.length,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.red,
        child: ListTile(
          title: Text(notes.elementAt(index).title),
          subtitle: Text(notes.elementAt(index).content),
        ),
      );
    },
  );
}
