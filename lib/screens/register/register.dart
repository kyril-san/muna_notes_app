// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/screens/login/widgets/login_widgets.dart';
import 'package:muna_notes_app/service/auth/bloc/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

late TextEditingController _email;
late TextEditingController _password;

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                controller: _email,
              ),
              SizedBox(height: 20.h),
              appTextfield(
                context,
                hint: 'Enter your Password',
                icon: Icons.lock,
                suffixicon: Icons.visibility,
                controller: _password,
              ),
              SizedBox(height: 20.h),
              appActionButtion(
                context,
                text: 'Register',
                func: () {
                  final email = _email.text;
                  final password = _password.text;

                  context.read<AuthBloc>().add(
                      AuthEventRegistering(email: email, password: password));
                },
              ),
              SizedBox(height: 50.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthEventLoggedOut(null));
                    },
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
      },
    );
  }
}
