import '../../../infrastructure/ruler/dtos/index.dart';

class RuleEntity {
  RuleEntity({
    required this.rules,
  });

  List<NodeRuleElement> rules;
}

class NodeRuleElement {
  NodeRuleElement({
    required this.id,
    required this.isGeneral,
    required this.isActive,
    required this.fixedPay,
    required this.runningPay,
    required this.parletPay,
    required this.centPay,
    required this.limitFixedPay,
    required this.limitRunningPay,
    required this.limitParletPay,
    required this.footCollectors,
    required this.turnsLimits,
    required this.maxCentBet,
    required this.maxFixedBet,
    required this.maxParletBet,
    required this.maxRunningBet,
    required this.footCollectorPaymentPerCent,
    required this.footCollectorPaymentPerFixed,
    required this.footCollectorPaymentPerParlet,
    required this.footCollectorPaymentPerRunning,
    required this.updatedAt,
    required this.name,
  });

  String id;
  bool isGeneral;
  bool isActive;
  int fixedPay;
  int runningPay;
  int parletPay;
  int centPay;
  int limitFixedPay;
  int limitRunningPay;
  int limitParletPay;
  List<String> footCollectors;
  TurnsLimits turnsLimits;
  int maxCentBet;
  int maxFixedBet;
  int maxParletBet;
  int maxRunningBet;
  int footCollectorPaymentPerCent;
  int footCollectorPaymentPerFixed;
  int footCollectorPaymentPerParlet;
  int footCollectorPaymentPerRunning;
  DateTime updatedAt;
  String name;
}
