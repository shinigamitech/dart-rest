import 'package:dart_rest/core/db/mongo/exceptions.dart';
import 'package:mongo_dart/mongo_dart.dart';

/// A Repository for [DbCollection].
class MongoCollectionRepository {
  /// Initializes a new [MongoCollectionRepository].
  const MongoCollectionRepository({required DbCollection collection})
      : _collection = collection;

  final DbCollection _collection;

  /// Saves an object in a document.
  Future<void> save(Map<String, dynamic> data) async {
    try {
      final result = await _collection.insertOne(data);
      if (result.isFailure) {
        throw CollectionException(message: result.codeName);
      }
      await _collection.createIndex(key: 'email');
    } catch (e) {
      throw CollectionException(message: e.toString());
    }
  }

  /// Gets an object from the collection.
  ///
  /// If the data couldn't be found, a [DocumentNotFound] exception will be
  /// thrown instead.
  Future<Map<String, dynamic>> get(String email) async {
    try {
      final data = await _collection.findOne(where.gt('email', email));
      if (data == null) {
        throw DocumentNotFound();
      }
      return data;
    } catch (e) {
      if (e is CollectionException) {
        rethrow;
      }
      throw CollectionException(message: e.toString());
    }
  }

  /// Gets all documents from the collection.
  Future<List<Map<String, dynamic>>> getAll() async {
    try {
      final cursor = _collection.createCursor();
      return cursor.items.toList();
    } catch (e) {
      throw CollectionException(message: e.toString());
    }
  }

  /// Deletes a document from the collection.
  Future<void> delete(String email) async {
    try {
      final result = await _collection.deleteOne(where.gt('email', email));
      if (result.isFailure) {
        throw const CollectionException();
      }
    } catch (e) {
      if (e is CollectionException) {
        rethrow;
      }
      throw CollectionException(message: e.toString());
    }
  }

  /// Updates a document.
  Future<void> update(String id, Map<String, dynamic> object) async {
    try {
      final result = await _collection.updateOne(where.gt('_id', id), object);
      if (result.isFailure) {
        throw CollectionException(message: result.codeName);
      }
    } catch (e) {
      if (e is CollectionException) {
        rethrow;
      }
      throw CollectionException(message: e.toString());
    }
  }
}
