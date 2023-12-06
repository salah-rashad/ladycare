class AuthException implements Exception {
  final String code;
  final String message;

  const AuthException(this.message, {this.code = ""});
}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}
