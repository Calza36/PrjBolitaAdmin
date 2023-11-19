abstract class PlayerAllRepositoryBase {
  Future<Map<String, dynamic>> getPlayerAllEntitiesByAscendancy();
  Future<Map<String, dynamic>> editPlayer(
      userId,
      status,
      bool checkManageCollectorsPermit,
      bool checkManageGeneralCollectorsPermit,
      bool checkManageFootCollectorsPermit,
      bool checkManageRulesPermit,
      bool checkAssingRulePermit,
      finalRuleId,currentRuleId);
  Future<Map<String, dynamic>> addPlayer(
      name, key, password, superiorId, userType);
}
