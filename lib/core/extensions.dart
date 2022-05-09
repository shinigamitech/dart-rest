import 'dart:convert';

/// An extension on [Map].
extension MapExtension on Map {
  /// Encodes this [Map] object into a [json].
  String get jsonify => json.encode(this);
}

/// An extension on [String].
extension StringExtension on String {
  /// Parses this [String] into a readable json body.
  String get toResponseBody => {'message': this}.jsonify;
}
