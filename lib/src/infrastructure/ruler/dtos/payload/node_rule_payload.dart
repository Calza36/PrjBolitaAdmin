class NodeRulePayload {
  NodeRulePayload({
    required this.id,
    required this.day,
    required this.month,
    required this.year,
    required this.turnToRun,
    required this.name,
    required this.fixedPay,
    required this.runningPay,
    required this.parletPay,
    required this.centPay,
    required this.limitFixedPay,
    required this.limitRunningPay,
    required this.limitParletPay,
    required this.operationType,
    required this.targetRule,
    required this.maxFixedBet,
    required this.maxRunningBet,
    required this.maxParletBet,
    required this.maxCentBet,
    required this.turnsLimits,
    required this.footCollectorPaymentPerFixed,
    required this.footCollectorPaymentPerRunning,
    required this.footCollectorPaymentPerParlet,
    required this.footCollectorPaymentPerCent,
  });
  String id;
  int day;
  int month;
  int year;
  String turnToRun;
  String name;
  int fixedPay;
  int runningPay;
  int parletPay;
  int centPay;
  int limitFixedPay;
  int limitRunningPay;
  int limitParletPay;
  String operationType;
  String targetRule;
  int maxFixedBet;
  int maxRunningBet;
  int maxParletBet;
  int maxCentBet;
  TurnsLimits turnsLimits;
  int footCollectorPaymentPerFixed;
  int footCollectorPaymentPerRunning;
  int footCollectorPaymentPerParlet;
  int footCollectorPaymentPerCent;
}

class TurnsLimits {
  TurnsLimits({
    required this.day,
    required this.night,
  });

  Day day;
  Day night;
}

class Day {
  Day({
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
  });

  int startHour;
  int startMinute;
  int endHour;
  int endMinute;
}
