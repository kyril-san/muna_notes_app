// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muna_notes_app/service/auth/auth_provider.dart';
import 'package:muna_notes_app/service/auth/auth_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider) : super(const AuthStateInitialize()) {
    on<AuthEventInitialize>((event, emit) async {
      await Future.delayed(Duration(seconds: 3));
      await provider.initialize();
      final user = provider.currentuser;
      if (user == null) {
        emit(AuthStateLoggedOut(exception: null));
      } else if (!user.isEmailVerified) {
        emit(AuthStateConfirmEmailVerification());
      } else {
        emit(AuthStateLoggedIn(user: user));
      }
    });

    on<AuthEventShouldRegister>((event, emit) {
      emit(AuthStateShouldRegister());
    });

    on<AuthEventLogIn>((event, emit) async {
      final email = event.email;
      final password = event.password;

      emit(const AuthStateLoggedOut(exception: null));
      try {
        final user = await provider.login(email: email, password: password);
        if (!user.isEmailVerified) {
          emit(const AuthStateConfirmEmailVerification());
        } else {
          emit(AuthStateLoggedIn(user: user));
        }
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(exception: e));
      }
    });

    on<AuthEventRegistering>((event, emit) async {
      emit(AuthStateLoggedOut(exception: null));

      final email = event.email;
      final password = event.password;
      try {
        await provider.register(email: email, password: password);
        await provider.isemailVerified();
        emit(AuthStateConfirmEmailVerification());
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(exception: e));
      }
    });

    on<AuthEventSendEmailVerification>((event, emit) async {
      await provider.isemailVerified();
      emit(state);
    });

    on<AuthEventLoggedOut>((event, emit) async {
      try {
        await provider.logout();
        emit(AuthStateLoggedOut(exception: null));
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(exception: e));
      }
    });
  }
}
