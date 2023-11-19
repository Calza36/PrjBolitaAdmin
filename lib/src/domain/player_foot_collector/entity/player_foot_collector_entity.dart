import '../../../infrastructure/ruler/dtos/index.dart';

class PlayerFootCollectorEntity {
  PlayerFootCollectorEntity({
    required this.id,
    required this.name,
    required this.key,
    required this.status,
    required this.rule,
    required this.userType,
  });

  String id;
  String name;
  RuleElement rule;
  String key;
  String status;
  String userType;
}
