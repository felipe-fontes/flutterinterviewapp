abstract class PostError implements Exception {
  final String message;

  PostError(this.message);
}

class InvalidMessage extends PostError {
  InvalidMessage(String message) : super(message);
}

class UnableToAdd extends PostError {
  UnableToAdd(String message) : super(message);
}

class UnableToGet extends PostError {
  UnableToGet(String message) : super(message);
}
