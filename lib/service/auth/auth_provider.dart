import 'package:muna_notes_app/service/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentuser;

  Future<AuthUser> login({
    required String email,
    required String password,
  });

  Future<AuthUser> register({
    required String email,
    required String password,
  });

  Future<void> initialize();
  Future<void> logout();
  Future<void> isemailVerified();
}
