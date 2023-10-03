import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:muna_notes_app/firebase_options.dart';
import 'package:muna_notes_app/service/auth/auth_exceptions.dart';
import 'package:muna_notes_app/service/auth/auth_provider.dart';
import 'package:muna_notes_app/service/auth/auth_user.dart';

class FirebaseAuthProvider implements AuthProvider {
  @override
  AuthUser? get currentuser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  Future<void> isemailVerified() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      // print('something is wrong somewhere');
    }
  }

  @override
  Future<AuthUser> login(
      {required String email, required String password}) async {
    try {
      await initialize();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = currentuser;
      if (user != null) {
        return user;
      } else {
        throw LoginErrorException();
      }
    } catch (_) {
      throw GenericAuthExceptions();
    }
  }

  @override
  Future<void> logout() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      // print('error');
    }
  }

  @override
  Future<AuthUser> register(
      {required String email, required String password}) async {
    try {
      await initialize();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = currentuser;
      if (user != null) {
        return user;
      } else {
        throw GenericAuthExceptions();
      }
    } catch (e) {
      throw GenericAuthExceptions();
    }
  }
}
