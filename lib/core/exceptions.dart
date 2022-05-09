/// An exception thrown by a service.
class ServiceException<T> implements Exception {
  /// Initializes a new [ServiceException].
  const ServiceException({required this.message});

  /// Error message.
  final String message;

  @override
  String toString() => 'ServiceException<$T>($message)';
}

/// An exception thrown when the expect data is not found.
class ObjectNotFound<T> implements ServiceException<T> {
  /// Initializes a new [ObjectNotFound]
  const ObjectNotFound({String? message}) : _message = message;

  final String? _message;

  @override
  String get message => _message ?? '$T not found';
}
