abstract class AuthExceptions implements Exception {
  const AuthExceptions();
}

class InvalidEmailException extends AuthExceptions {}

class UserNotLoggedInException extends AuthExceptions {}

class UserNotFoundException extends AuthExceptions {}

class UserDisabledException extends AuthExceptions {}

class WrondPasswordException extends AuthExceptions {}

class EmailAlreadyInException extends AuthExceptions {}

class OperationNotFoundException extends AuthExceptions {}

class WeakPasswordException extends AuthExceptions {}

class InvalidCredentialsException extends AuthExceptions {}

class EmailVerificationErrorExceptions extends AuthExceptions {}

class GenericAuthExceptions extends AuthExceptions {}
