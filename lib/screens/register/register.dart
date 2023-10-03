// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/screens/login/widgets/login_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Register Page',
          style: AppTextstyle.nunitoRegularwhite,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appTextfield(
            context,
            hint: 'Enter in Your Email Address',
            icon: Icons.email,
          ),
          SizedBox(height: 20.h),
          appTextfield(context,
              hint: 'Enter your Password',
              icon: Icons.lock,
              suffixicon: Icons.visibility),
          SizedBox(height: 20.h),
          appActionButtion(
            context,
            text: 'Register',
            func: () {},
          ),
          SizedBox(height: 50.h),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.white,
                ),
              ),
              // Text(" If you don't have an account"),
              TextButton(
                onPressed: () {},
                child: Text('Tf You have an account, Click here to Log In'),
              ),
              Expanded(
                child: Divider(
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
