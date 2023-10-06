// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/screens/login/widgets/login_widgets.dart';
import 'package:muna_notes_app/service/auth/auth_exceptions.dart';
import 'package:muna_notes_app/service/auth/bloc/auth_bloc.dart';
import 'package:muna_notes_app/utils/dialogs/show_error_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _email;
  late TextEditingController _password;
  bool clicked = true;
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
        if (state is AuthStateRegistering) {
          if (state.exception is InvalidEmailException) {
            await showErrorDialog(context,
                text: 'The Email Address is Invalid');
          } else if (state.exception is EmailAlreadyInUseException) {
            await showErrorDialog(context,
                text: 'This Email Address is Already in Use');
          } else if (state.exception is OperationNotFoundException) {
            await showErrorDialog(context,
                text: 'This Operation is not allowed at the Moment');
          } else if (state.exception is WeakPasswordException) {
            await showErrorDialog(context, text: 'The Password is too weak');
          } else if (state.exception is GenericAuthExceptions) {
            await showErrorDialog(context,
                text: 'Authentication Error!!! \nTry again Later');
          }
        }
      },
      child: Scaffold(
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
              obscure: false,
            ),
            SizedBox(height: 20.h),
            appTextfield(context,
                hint: 'Enter your Password',
                icon: Icons.lock,
                suffixicon: Icons.visibility,
                changedsuffixicon: Icons.visibility_off,
                controller: _password,
                obscure: clicked, onpressed: () {
              setState(() {
                clicked = !clicked;
              });
            }),
            SizedBox(height: 20.h),
            appActionButtion(
              context,
              text: 'Register',
              func: () async {
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
                    // Navigator.of(context).pop();
                    context.read<AuthBloc>().add(AuthEventLoggedOut());
                  },
                  child: Text('If You have an account, Click here to Log In'),
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
