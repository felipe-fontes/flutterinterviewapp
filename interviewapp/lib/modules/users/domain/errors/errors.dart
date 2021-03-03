abstract class UserError implements Exception {
  String message;

  UserError(this.message);
}

class InvalidLogin extends UserError {
  final String message;

  InvalidLogin(this.message) : super(message);
}

class UnableToCreate extends UserError {
  final String message;

  UnableToCreate(this.message) : super(message);
}

class UnableToGetLoggedUser extends UserError {
  final String message;

  UnableToGetLoggedUser(this.message) : super(message);
}

class UserNotLogged extends UserError {
  final String message;

  UserNotLogged(this.message) : super(message);
}

class UnableToLogin extends UserError {
  final String message;

  UnableToLogin(this.message) : super(message);
}

class InvalidEmail extends UserError {
  final String message;

  InvalidEmail(this.message) : super(message);
}

class InvalidName extends UserError {
  final String message;

  InvalidName(this.message) : super(message);
}

class InvalidPassword extends UserError {
  final String message;

  InvalidPassword(this.message) : super(message);
}
