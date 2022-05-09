import 'package:dart_rest/core/exceptions.dart';
import 'package:dart_rest/core/extensions.dart';
import 'package:dart_rest/user/services/user_service.dart';
import 'package:dart_rest/user/user.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

/// Controller for user.
class UserController {
  /// Initializes a new [UserController].
  const UserController({required IUserService service}) : _service = service;
  final IUserService _service;

  /// Gets the user.
  Future<Response> getUser(Request request) async {
    final id = request.params['id'];
    print('PARAM: $id');
    if (id == null || id.isEmpty) {
      return home(request);
    }
    late final User user;
    try {
      user = await _service.getUser(id);
      return Response.ok(user.toJson());
    } on ServiceException catch (e) {
      return Response.notFound(e.message.toResponseBody);
    }
  }

  /// Updates a user from id.
  Future<Response> updateUser(Request request) async {
    final res = request.readAsString();
    print(res);

    return Response.ok('res');
  }

  /// Base path of this controller.
  static const basePath = '/user';

  ///
  Future<Response> home(Request request) async => Response.badRequest();

  /// Adds handlers to the [router].
  void registerRoutes(Router router) {
    router
      ..get(basePath, home)
      ..get('$basePath/<id>', getUser)
      ..post('$basePath/<id>', updateUser);
  }
}
