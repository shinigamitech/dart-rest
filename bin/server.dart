import 'dart:io';

import 'package:dart_rest/core/db/mongo/collection_repository.dart';
import 'package:dart_rest/core/db/mongo/mongo_service.dart';
import 'package:dart_rest/user/controllers/user_controller.dart';
import 'package:dart_rest/user/services/user_service.dart';
import 'package:dart_rest/user/services/user_service_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final MongoCollectionRepository usersRepo = MongoCollectionRepository(
  collection: DbCollection(MongoDBService().db, 'users'),
);

final IUserService userService = UserServiceMongoImpl(
  collectionRepository: usersRepo,
);

final userController = UserController(service: userService);

final _router = Router()..get('/', _rootHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Future<void> main(List<String> args) async {
  userController.registerRoutes(_router);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  const pipeline = Pipeline();

  // Configure a pipeline that logs requests.
  final _handler = pipeline.addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  await Future.wait([MongoDBService().init(), serve(_handler, ip, port)]);

  print('Server listening on port $port');
}
