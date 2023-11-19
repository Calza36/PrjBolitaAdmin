import '../../../infrastructure/ruler/dtos/index.dart';

class PlayerGeneralCollectorEntity {
  PlayerGeneralCollectorEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.userType,
    required this.rule,
  });

  String id;
  String name;
  String status;
  String userType;
  RuleElement rule;
}
