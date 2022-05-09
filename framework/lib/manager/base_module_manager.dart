import 'package:framework/interfaces/module.dart';

abstract class BaseModuleManager {
  /// Initial module identifier.
  static const String initialKey = 'module';

  /// Registers a [module] in the [store].
  ///
  /// The parameter [key] is the identifier of the registered module. If not
  /// provided, the default key [BaseModule.initialKey] will be used instead.
  void register<M extends Module>({
    required M module,
    String key = initialKey,
  });

  /// Checks if a module of type [M] has been registered.
  bool isRegistered<M extends Module>([String? key]);

  /// Retrieves a module from the [store].
  ///
  /// The parameter [key] is the identifier of the module of type [M] in
  /// the store.
  ///
  /// If the module with the key [key] is found in the store but the said module
  /// is not of type [M], `null` will be returned.
  M? retrieve<M extends Module>([String? key]);

  /// A store that holds all the modules per keys.
  Map<String, Module> get store;

  /// Removes the module [M] at the key [key] from the store.
  ///
  /// If no [key] is passed, the default key will be used instead.
  void remove<M extends Module>([String? key]);

  /// Removes all modules from the [store].
  void clean();
}
