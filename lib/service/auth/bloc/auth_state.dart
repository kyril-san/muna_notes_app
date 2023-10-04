// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingtext;
  const AuthState(
      {required this.isLoading, this.loadingtext = 'Please wait a moment'});
}

class AuthStateInitialize extends AuthState {
  const AuthStateInitialize({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;

  const AuthStateLoggedIn({required bool isLoading, required this.user})
      : super(isLoading: isLoading);
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut(
      {required bool isLoading, required this.exception, String? text})
      : super(isLoading: isLoading, loadingtext: text);

  @override
  List<Object?> get props => [exception, isLoading];
}

class AuthStateRegistering extends AuthState {
  final Exception? exception;

  const AuthStateRegistering({required this.exception, required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateConfirmEmailVerification extends AuthState {
  const AuthStateConfirmEmailVerification({required bool isLoading})
      : super(isLoading: isLoading);
}
