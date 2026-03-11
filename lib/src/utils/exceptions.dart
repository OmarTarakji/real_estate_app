class AuthException implements Exception {
  final String message;
  const AuthException(this.message);
}

class ApiException implements Exception {
  final String message;
  const ApiException(this.message);
}
