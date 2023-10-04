part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthStateInitialize extends AuthState {
  const AuthStateInitialize();
}

class AuthStateShouldRegister extends AuthState {
  const AuthStateShouldRegister();
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;

  const AuthStateLoggedIn({required this.user});
}

class AuthStateLoggedOut extends AuthState {
  final Exception? exception;
  const AuthStateLoggedOut({required this.exception});
}

class AuthStateRegistering extends AuthState {
  const AuthStateRegistering();
}

class AuthStateConfirmEmailVerification extends AuthState {
  const AuthStateConfirmEmailVerification();
}
