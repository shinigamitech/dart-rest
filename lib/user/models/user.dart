import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// A model for the user
@immutable
@JsonSerializable(fieldRename: FieldRename.kebab)
class User with EquatableMixin {
  /// Initializes a new [User].
  const User({
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
    this.pictureUrl,
  });

  /// Instantiates a new [User] from a JSON Map.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// User's unique ID.
  final String id;

  /// User's email address.
  final String email;

  /// User's first name.
  final String firstName;

  /// User's last name.
  final String lastName;

  /// User's profile picture.
  final String? pictureUrl;

  /// Parses this [User] model to a JSON Map.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Copies this user and returns a new one.
  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? pictureUrl,
  }) =>
      User(
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        pictureUrl: pictureUrl ?? this.pictureUrl,
      );

  @override
  List<String?> get props => [id, email, firstName, lastName, pictureUrl];
}
