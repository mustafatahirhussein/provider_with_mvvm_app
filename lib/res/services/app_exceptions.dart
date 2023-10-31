class AppExceptions implements Exception {

  final String message, prefix;
  AppExceptions(this.message, this.prefix);

  @override
  String toString() {
    // TODO: implement toString
    return '$prefix - $message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message!, "Error during communication");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message!, "Bad request");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message]) : super(message!, "Unauthorized");
}
