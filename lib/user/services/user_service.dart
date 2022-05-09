// ignore_for_file: no_runtimetype_tostring

import 'dart:async';

import 'package:dart_rest/user/models/user.dart';

/// An interface of the user service.
abstract class IUserService {
  /// Creates a new [user].
  FutureOr<void> createUser(User user);

  /// Gets a user by [id].
  FutureOr<User> getUser(String id);

  /// Deletes user by [id].
  FutureOr<void> deleteUser(String id);

  /// Updates the user whose id is [id].
  FutureOr<void> updateUser(String id, User user);
}
