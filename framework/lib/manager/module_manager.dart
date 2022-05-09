import 'package:framework/interfaces/controller.dart';
import 'package:framework/interfaces/module.dart';
import 'package:framework/interfaces/service.dart';
import 'package:framework/manager/base_module_manager.dart';

class ModuleManager extends BaseModuleManager {
  @override
  void clean() {
    // TODO: implement clean
  }

  final _store = <String, Module>{};

  @override
  bool isRegistered<M extends Module<Service, Controller>>([String? key]) {
    return _store[key ?? BaseModuleManager.initialKey] is M;
  }

  @override
  void register<M extends Module<Service, Controller>>({
    required M module,
    String key = BaseModuleManager.initialKey,
  }) {
    // TODO: implement register
  }

  @override
  void remove<M extends Module<Service, Controller>>([String? key]) {
    // TODO: implement remove
  }

  @override
  M? retrieve<M extends Module<Service, Controller>>([String? key]) {
    if (isRegistered<M>(key)) {
      final result = _store[key ?? BaseModuleManager.initialKey];
      return result;
    }
  }

  @override
  Map<String, Module<Service, Controller>> get store => _store;
}
