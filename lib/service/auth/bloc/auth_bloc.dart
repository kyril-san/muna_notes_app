import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:muna_notes_app/service/auth/auth_provider.dart';
import 'package:muna_notes_app/service/auth/auth_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider)
      : super(const AuthStateInitialize(isLoading: true)) {
    //! on App Initialization
    on<AuthEventInitialize>((event, emit) async {
      await provider.initialize();
      final user = provider.currentuser;
      if (user == null) {
        emit(AuthStateLoggedOut(exception: null, isLoading: false));
      } else if (!user.isEmailVerified) {
        emit(const AuthStateConfirmEmailVerification(isLoading: false));
      } else {
        emit(AuthStateLoggedIn(user: user, isLoading: false));
      }
    });

//! To take it to Register Page
    on<AuthEventShouldRegister>((event, emit) {
      emit(const AuthStateRegistering(isLoading: false, exception: null));
    });

//! App Login
    on<AuthEventLogIn>((event, emit) async {
      emit(AuthStateLoggedOut(
          isLoading: true,
          exception: null,
          text: 'Please wait while I sign you in'));
      final email = event.email;
      final password = event.password;

      try {
        final user = await provider.login(email: email, password: password);
        if (!user.isEmailVerified) {
          emit(AuthStateLoggedOut(isLoading: false, exception: null));
          emit(const AuthStateConfirmEmailVerification(isLoading: false));
        } else {
          emit(AuthStateLoggedOut(
            exception: null,
            isLoading: false,
          ));
        }
        emit(AuthStateLoggedIn(
          isLoading: false,
          user: user,
        ));
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(exception: e, isLoading: false));
      }
    });

//! App registration
    on<AuthEventRegistering>((event, emit) async {
      final email = event.email;
      final password = event.password;
      try {
        await provider.register(email: email, password: password);
        await provider.isemailVerified();
        emit(const AuthStateConfirmEmailVerification(isLoading: false));
      } on Exception catch (e) {
        emit(AuthStateRegistering(exception: e, isLoading: false));
      }
    });

//! App Send Email Verification
    on<AuthEventSendEmailVerification>((event, emit) async {
      await provider.isemailVerified();
      emit(state);
    });

//! App Log out
    on<AuthEventLoggedOut>((event, emit) async {
      try {
        await provider.logout();
        emit(AuthStateLoggedOut(exception: null, isLoading: false));
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(exception: e, isLoading: false));
      }
    });
  }
}
