import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String id;
  final bool isEmailVerified;
  final String email;
  const AuthUser({
    required this.email,
    required this.id,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) {
    return AuthUser(
        id: user.uid, isEmailVerified: user.emailVerified, email: user.email!);
  }
}
