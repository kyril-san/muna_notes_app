import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/screens/login/widgets/login_widgets.dart';
import 'package:muna_notes_app/service/auth/bloc/auth_bloc.dart';

class EmailVerifyPage extends StatelessWidget {
  const EmailVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'An Email verification has been sent to your email.\nIf you did not receive an email, click the button below to resend your email verification link',
                    style: AppTextstyle.nunitoLightwhite,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(300.w, 50.h)),
                    onPressed: () async {
                      context
                          .read<AuthBloc>()
                          .add(const AuthEventSendEmailVerification());
                    },
                    child: Text(
                      'Resend Email Verification',
                      style: AppTextstyle.nunitolightblack,
                    ),
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  appActionButtion(context, text: 'Click here to Login',
                      func: () {
                    context.read<AuthBloc>().add(const AuthEventLoggedOut());
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
