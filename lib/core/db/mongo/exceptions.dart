/// An exception thrown when an operation on a mongo collection fails.
// ignore_for_file: no_runtimetype_tostring

class CollectionException implements Exception {
  /// Initializes a new [CollectionException].
  const CollectionException({this.message});

  /// The error message.
  final String? message;

  @override
  String toString() => '$runtimeType::$message';
}

/// A [CollectionException] thrown when the document queried is not found.
class DocumentNotFound implements CollectionException {
  @override
  String? get message => 'document not found';
}
