// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String id;
  final bool isEmailVerified;
  AuthUser({
    required this.id,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) {
    return AuthUser(id: user.uid, isEmailVerified: user.emailVerified);
  }
}
