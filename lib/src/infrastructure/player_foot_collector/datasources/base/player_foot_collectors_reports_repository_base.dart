abstract class PlayerFootCollectorRepositoryBase {
  Future<Map<String, dynamic>> getPlayerFootCollectorEntitiesByAscendancy();

  Future<Map> deletePlayer(String id);
}
