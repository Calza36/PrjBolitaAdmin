import 'package:flutter/foundation.dart';

import '../../dtos/payload/node_rule_payload.dart';
import '../../index.dart';
import '../base/node_rule_repository_base.dart';

class NodeRulesRepository extends NodeRuleRepositoryBase {
  @override
  Future<Map<String, dynamic>> getPrivateRulesNodes() async {
    return await NodeRuleProvider().getPrivateRules();
  }

  @override
  Future<Map<String, dynamic>> addAssignmentRule(
    day,
    month,
    year,
    turnToRun,
    operationType,
    targetRule,
    targetUser,
  ) {
    return NodeRuleProvider().addAssignmentRule(
      day,
      month,
      year,
      turnToRun,
      operationType,
      targetRule,
      targetUser,
    );
  }
}
