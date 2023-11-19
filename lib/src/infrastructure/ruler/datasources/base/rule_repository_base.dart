import '../../dtos/index.dart';
import '../../dtos/payload/node_rule_payload.dart';

abstract class RuleRepositoryBase {
  Future<Map<String, dynamic>> getPrivateRules();
  Future<RuleElement?> getGeneralRule();
  Future<Map<String, dynamic>> editRule(
      NodeRulePayload nodeRulePayload, bool isInUse);
  Future<Map<String, dynamic>> addRule(NodeRulePayload nodeRulePayload);
}
