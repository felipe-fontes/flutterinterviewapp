import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';

abstract class BasePost {
  int _messageLength = 280;

  Either<InvalidMessage, bool> _validateMessageLength(String message) {
    if (message.length > _messageLength) {
      return Left(InvalidMessage(
          'Your message is too long, try to stay below $_messageLength'));
    }

    return Right(true);
  }

  Either<InvalidMessage, bool> validateMessage(String message) {
    if (message == null || message.isEmpty) {
      return Left(InvalidMessage('A message is required'));
    }

    final lengthValidation = _validateMessageLength(message);
    if (lengthValidation.isLeft()) return lengthValidation;

    return Right(true);
  }
}
