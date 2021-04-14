class ModelNotFoundError implements Exception {
  String cause;
  ModelNotFoundError({required this.cause});
}

class FieldNotFound implements Exception {
  String cause;
  FieldNotFound({required this.cause});
}

class UnknownError implements Exception {
  String cause;
  UnknownError({required this.cause});
}

class NotAllowedError implements Exception {
  String cause;
  NotAllowedError({required this.cause});
}

class ModelLoadingError implements Exception {
  String cause;
  ModelLoadingError({required this.cause});
}

class WrongFormatError implements Exception {
  String cause;
  WrongFormatError({required this.cause});
}

class InvalidInputError implements Exception {
  String cause;
  InvalidInputError({required this.cause});
}
