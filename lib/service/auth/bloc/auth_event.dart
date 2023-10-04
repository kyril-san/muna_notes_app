part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventShouldRegister extends AuthEvent {
  const AuthEventShouldRegister();
}

class AuthEventLogIn extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLogIn({required this.email, required this.password});
}

class AuthEventLoggedOut extends AuthEvent {
  // final Exception? exception;

  const AuthEventLoggedOut();
}

class AuthEventRegistering extends AuthEvent {
  final String email;
  final String password;

  const AuthEventRegistering({required this.email, required this.password});
}

class AuthEventSendEmailVerification extends AuthEvent {}
