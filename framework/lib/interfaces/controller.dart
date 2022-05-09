import 'package:framework/interfaces/service.dart';

/// A controller.
abstract class Controller {
  const Controller({required this.service});

  /// The [Service] associated with this [Controller].
  final Service service;
}
