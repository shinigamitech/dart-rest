import 'package:framework/interfaces/controller.dart';
import 'package:framework/interfaces/service.dart';

abstract class Module<S extends Service, C extends Controller> {
  const Module({required this.controller, required this.service});
  final S service;
  final C controller;
}

class ModuleFactory {
  const ModuleFactory._internal();

  factory ModuleFactory() => _instance ??= const ModuleFactory._internal();

  static ModuleFactory? _instance;
}
