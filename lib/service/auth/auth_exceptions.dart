abstract class AuthExceptions implements Exception {
  const AuthExceptions();
}

class GenericAuthExceptions extends AuthExceptions {}

class LoginErrorException extends AuthExceptions {}
