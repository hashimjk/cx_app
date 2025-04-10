class AppExceptions implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message $_prefix';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException(String? message)
    : super(message, 'Error during communication');
}

class BadRequestException extends AppExceptions {
  BadRequestException(String? message) : super(message, 'Invalid Request');
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException(String? message)
    : super(message, 'unauthorized Request');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException(String? message) : super(message, 'Invalid Input');
}
