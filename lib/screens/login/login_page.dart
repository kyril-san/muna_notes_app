// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/screens/login/widgets/login_widgets.dart';
import 'package:muna_notes_app/screens/register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login Page',
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
            text: 'Login',
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
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => RegisterPage()));
                },
                child: Text('If you don\'t have an account, Click Here'),
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
