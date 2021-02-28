abstract class PostError implements Exception {
  final String message;

  PostError(this.message);
}

class InvalidPost extends PostError {
  InvalidPost(String message) : super(message);
}

class InvalidMessage extends PostError {
  InvalidMessage(String message) : super(message);
}

class UnableToAdd extends PostError {
  UnableToAdd(String message) : super(message);
}

class UnableToDelete extends PostError {
  UnableToDelete(String message) : super(message);
}

class UnableToUpdate extends PostError {
  UnableToUpdate(String message) : super(message);
}

class UnableToGet extends PostError {
  UnableToGet(String message) : super(message);
}
