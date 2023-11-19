
abstract class NodeRuleRepositoryBase {
  Future<Map<String, dynamic>> getPrivateRulesNodes();
  Future<Map<String, dynamic>> addAssignmentRule(
    day,
    month,
    year,
    turnToRun,
    operationType,
    targetRule,
    targetUser,
  );
}
