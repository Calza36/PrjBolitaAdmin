// To parse this JSON data, do
//
//     final rule = ruleFromMap(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/services/get_it_mock.dart';

part 'rule.freezed.dart';
part 'rule.g.dart';

@freezed
class Rule with _$Rule {
  const factory Rule({
    List<RuleElement>? rules,
  }) = _Rule;

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);
}

@freezed
class RuleElement with _$RuleElement {
  const factory RuleElement({
    String? id,
    bool? isGeneral,
    bool? isActive,
    int? fixedPay,
    int? runningPay,
    int? parletPay,
    int? centPay,
    int? limitFixedPay,
    int? limitRunningPay,
    int? limitParletPay,
    List<String>? footCollectors,
    TurnsLimits? turnsLimits,
    int? maxCentBet,
    int? maxFixedBet,
    int? maxParletBet,
    int? maxRunningBet,
    int? footCollectorPaymentPerCent,
    int? footCollectorPaymentPerFixed,
    int? footCollectorPaymentPerParlet,
    int? footCollectorPaymentPerRunning,
    DateTime? updatedAt,
    String? name,
  }) = _RuleElement;

  factory RuleElement.fromJson(Map<String, dynamic> json) =>
      _$RuleElementFromJson(json);
}

@freezed
class TurnsLimits with _$TurnsLimits {
  const factory TurnsLimits({
    Day? day,
    Day? night,
    String? id,
  }) = _TurnsLimits;

  factory TurnsLimits.fromJson(Map<String, dynamic> json) =>
      _$TurnsLimitsFromJson(json);
}

@freezed
class Day with _$Day {
  const factory Day({
    int? startHour,
    int? startMinute,
    int? endHour,
    int? endMinute,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

extension RulesExtension on Rule {
  Future<RuleElement> getGeneral() async {
    await GetItMock.configurePrefs();
    final rawJson = GetItMock.prefs.getString("generalRule")!;

    Map<String, dynamic> map = jsonDecode(rawJson);
    RuleElement gRuleObj = RuleElement.fromJson(map);
    return gRuleObj;
  }

  Rule getPrivateRules() {
    final rawJson = GetItMock.prefs.getString("privateRules")!;
    Map<String, dynamic> map = jsonDecode(rawJson);
    Rule gRulesObj = Rule.fromJson(map);
    return gRulesObj;
  }
}
