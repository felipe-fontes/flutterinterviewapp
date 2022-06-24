import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';
import 'package:interviewapp/shared/utils/strings.dart';

abstract class BasePost {
  int _messageLength = 280;

  Either<InvalidMessage, bool> _validateMessageLength(String message) {
    if (message.length > _messageLength) {
      return Left(
          InvalidMessage('{$AppString.longMessageError} $_messageLength'));
    }

    return Right(true);
  }

  Either<InvalidMessage, bool> validateMessage(String message) {
    if (message == null || message.isEmpty) {
      return Left(InvalidMessage(AppString.messageRequired));
    }

    final lengthValidation = _validateMessageLength(message);
    if (lengthValidation.isLeft()) return lengthValidation;

    return Right(true);
  }
}
