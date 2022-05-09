/// Service interface for database.
abstract class IDBService {
  /// Initializes and sets DB configurations.
  Future<void> init();

  /// Kills all db services.
  Future<void> kill();
}
