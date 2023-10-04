// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/screens/login/widgets/login_widgets.dart';
import 'package:muna_notes_app/screens/register/register.dart';
import 'package:muna_notes_app/service/auth/auth_exceptions.dart';
import 'package:muna_notes_app/service/auth/bloc/auth_bloc.dart';
import 'package:muna_notes_app/utils/dialogs/show_error_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

late TextEditingController _email;
late TextEditingController _password;

class _LoginPageState extends State<LoginPage> {
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLoggedOut) {
          if (state.exception is GenericAuthExceptions) {
            await showErrorDialog(context, text: 'Authentication Error!!!');
          } else if (state is InvalidCredentialsException) {
            await showErrorDialog(context, text: 'Invalid Credentials');
          } else if (state is InvalidEmailException) {
            await showErrorDialog(context, text: 'Invalid Email Address Used');
          } else if (state is UserDisabledException) {
            await showErrorDialog(context,
                text: 'Your Account has been Disabled.');
          } else if (state is UserNotFoundException) {
            await showErrorDialog(context, text: 'Your Account does not exist');
          } else if (state is WrondPasswordException) {
            await showErrorDialog(context, text: 'Your Password is Incorrect');
          }
        }
      },
      child: Scaffold(
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
              text: 'Login',
              func: () async {
                final email = _email.text;
                final password = _password.text;
                context
                    .read<AuthBloc>()
                    .add(AuthEventLogIn(email: email, password: password));
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
                // Text(" If you don't have an account"),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthEventShouldRegister());
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
      ),
    );
  }
}
