import 'package:flutter/foundation.dart';

import '../../dtos/payload/node_rule_payload.dart';
import '../../index.dart';
import '../base/rule_repository_base.dart';

class RulesRepository extends RuleRepositoryBase {
  @override
  Future<Map<String, dynamic>> getPrivateRules() async {
    return await RuleProvider().getPrivateRules();
  }

  @override
  Future<RuleElement?> getGeneralRule() async {
    try {
      return await RuleProvider().getGeneralRule();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>> editRule(
      NodeRulePayload nodeRulePayload, bool isInUse) {
    return RuleProvider().editRule(nodeRulePayload, isInUse);
  }

  @override
  Future<Map<String, dynamic>> addRule(NodeRulePayload nodeRulePayload) {
    return RuleProvider().addRule(nodeRulePayload);
  }
}
