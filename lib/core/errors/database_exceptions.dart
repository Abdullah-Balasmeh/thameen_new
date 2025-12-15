class DatabaseException implements Exception {
  final String message;
  const DatabaseException(this.message);

  @override
  String toString() => message;
}

class DocumentNotFoundException extends DatabaseException {
  const DocumentNotFoundException() : super('Document not found');
}

class PermissionDeniedException extends DatabaseException {
  const PermissionDeniedException() : super('Permission denied');
}

class UnknownDatabaseException extends DatabaseException {
  const UnknownDatabaseException() : super('Unknown database error');
}
