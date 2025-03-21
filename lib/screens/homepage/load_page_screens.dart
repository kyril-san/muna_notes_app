import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muna_notes_app/screens/homepage/home_page.dart';
import 'package:muna_notes_app/screens/login/email_verify_page.dart';
import 'package:muna_notes_app/screens/login/login_page.dart';
import 'package:muna_notes_app/screens/register/register.dart';
import 'package:muna_notes_app/service/auth/bloc/auth_bloc.dart';
import 'package:muna_notes_app/utils/helpers/loading_screen.dart';

class LoadPageScreens extends StatelessWidget {
  const LoadPageScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
              context: context,
              text: state.loadingtext ?? 'Please Wait a moment');
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const HomePage();
        } else if (state is AuthStateRegistering) {
          return const RegisterPage();
        } else if (state is AuthStateConfirmEmailVerification) {
          return const EmailVerifyPage();
        } else if (state is AuthStateLoggedOut) {
          return const LoginPage();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
