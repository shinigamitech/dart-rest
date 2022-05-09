import 'dart:async';

import 'package:dart_rest/core/db/mongo/collection_repository.dart';
import 'package:dart_rest/core/db/mongo/exceptions.dart';
import 'package:dart_rest/core/exceptions.dart';
import 'package:dart_rest/user/models/user.dart';
import 'package:dart_rest/user/services/user_service.dart';

/// An implementation of [IUserService] with MongoDB.
class UserServiceMongoImpl implements IUserService {
  /// Initializes a new [UserServiceMongoImpl].
  const UserServiceMongoImpl({
    required MongoCollectionRepository collectionRepository,
  }) : _repository = collectionRepository;

  final MongoCollectionRepository _repository;
  @override
  FutureOr<void> createUser(User user) async {
    try {
      await _repository.save(user.toJson());
    } catch (e) {
      throw ServiceException<User>(message: e.toString());
    }
  }

  @override
  FutureOr<void> deleteUser(String id) async {
    try {
      await _repository.delete(id);
    } catch (e) {
      throw ServiceException<User>(message: e.toString());
    }
  }

  @override
  FutureOr<User> getUser(String id) async {
    try {
      final userData = await _repository.get(id);
      return User.fromJson(userData);
    } on DocumentNotFound {
      throw const ObjectNotFound<User>();
    } catch (e) {
      throw ServiceException<User>(message: e.toString());
    }
  }

  @override
  FutureOr<void> updateUser(String id, User user) async {
    try {
      await _repository.update(id, user.toJson());
    } catch (e) {
      throw ServiceException<User>(message: e.toString());
    }
  }
}
