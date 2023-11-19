import '../../../infrastructure/ruler/dtos/index.dart';

class PlayerCollectorEntity {
  PlayerCollectorEntity({
    required this.id,
    required this.name,
    required this.key,
    required this.status,
    required this.userType,
    required this.rule,
  });

  String id;
  String name;
  String key;
  String status;
  String userType;
  RuleElement rule;
}
