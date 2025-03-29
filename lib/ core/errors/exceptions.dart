// Network-related exceptions
class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

// Server-related exceptions
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => 'ServerException: $message${statusCode != null ? ' (Status $statusCode)' : ''}';
}

// Registration-specific exceptions
class RegistrationException implements Exception {
  final String message;
  const RegistrationException(this.message);

  @override
  String toString() => 'RegistrationException: $message';
}