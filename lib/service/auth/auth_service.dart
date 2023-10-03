import 'package:muna_notes_app/service/auth/auth_provider.dart';
import 'package:muna_notes_app/service/auth/auth_user.dart';

class Authservice implements AuthProvider {
  final AuthProvider provider;

  Authservice(this.provider);

  @override
  AuthUser? get currentuser => provider.currentuser;

  @override
  Future<void> initialize() {
    return provider.initialize();
  }

  @override
  Future<void> isemailVerified() {
    return provider.isemailVerified();
  }

  @override
  Future<AuthUser> login({required String email, required String password}) {
    return provider.login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return provider.logout();
  }

  @override
  Future<AuthUser> register({required String email, required String password}) {
    return provider.register(email: email, password: password);
  }
}
