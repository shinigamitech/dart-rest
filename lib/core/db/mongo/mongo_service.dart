import 'package:dart_rest/core/db/db_service.dart';
import 'package:mongo_dart/mongo_dart.dart';

/// An implementation of [IDBService] with mongo DB.
class MongoDBService implements IDBService {
  /// [MongoDBService] singleton object.
  factory MongoDBService() => _instance ??= MongoDBService._internal();
  MongoDBService._internal();

  static MongoDBService? _instance;

  /// Creates a DB.
  final db = Db('mongodb://localhost:27017/example');

  @override
  Future<void> init() async {
    await db.open().onError((error, stackTrace) {
      print('MongoDB:: $error');
    });
  }

  @override
  Future<void> kill() async {
    if (db.state != State.CLOSED) {
      await db.close();
    }
  }

  /// Gets a collection.
  DbCollection getCollection(String name) => db.collection(name);
}
