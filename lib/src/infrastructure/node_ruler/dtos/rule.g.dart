// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rule _$$_RuleFromJson(Map<String, dynamic> json) => _$_Rule(
      rules: (json['rules'] as List<dynamic>?)
          ?.map((e) => RuleElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RuleToJson(_$_Rule instance) => <String, dynamic>{
      'rules': instance.rules,
    };

_$_RuleElement _$$_RuleElementFromJson(Map<String, dynamic> json) =>
    _$_RuleElement(
      id: json['id'] as String?,
      isGeneral: json['isGeneral'] as bool?,
      isActive: json['isActive'] as bool?,
      fixedPay: json['fixedPay'] as int?,
      runningPay: json['runningPay'] as int?,
      parletPay: json['parletPay'] as int?,
      centPay: json['centPay'] as int?,
      limitFixedPay: json['limitFixedPay'] as int?,
      limitRunningPay: json['limitRunningPay'] as int?,
      limitParletPay: json['limitParletPay'] as int?,
      footCollectors: (json['footCollectors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      turnsLimits: json['turnsLimits'] == null
          ? null
          : TurnsLimits.fromJson(json['turnsLimits'] as Map<String, dynamic>),
      maxCentBet: json['maxCentBet'] as int?,
      maxFixedBet: json['maxFixedBet'] as int?,
      maxParletBet: json['maxParletBet'] as int?,
      maxRunningBet: json['maxRunningBet'] as int?,
      footCollectorPaymentPerCent: json['footCollectorPaymentPerCent'] as int?,
      footCollectorPaymentPerFixed:
          json['footCollectorPaymentPerFixed'] as int?,
      footCollectorPaymentPerParlet:
          json['footCollectorPaymentPerParlet'] as int?,
      footCollectorPaymentPerRunning:
          json['footCollectorPaymentPerRunning'] as int?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_RuleElementToJson(_$_RuleElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isGeneral': instance.isGeneral,
      'isActive': instance.isActive,
      'fixedPay': instance.fixedPay,
      'runningPay': instance.runningPay,
      'parletPay': instance.parletPay,
      'centPay': instance.centPay,
      'limitFixedPay': instance.limitFixedPay,
      'limitRunningPay': instance.limitRunningPay,
      'limitParletPay': instance.limitParletPay,
      'footCollectors': instance.footCollectors,
      'turnsLimits': instance.turnsLimits,
      'maxCentBet': instance.maxCentBet,
      'maxFixedBet': instance.maxFixedBet,
      'maxParletBet': instance.maxParletBet,
      'maxRunningBet': instance.maxRunningBet,
      'footCollectorPaymentPerCent': instance.footCollectorPaymentPerCent,
      'footCollectorPaymentPerFixed': instance.footCollectorPaymentPerFixed,
      'footCollectorPaymentPerParlet': instance.footCollectorPaymentPerParlet,
      'footCollectorPaymentPerRunning': instance.footCollectorPaymentPerRunning,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
    };

_$_TurnsLimits _$$_TurnsLimitsFromJson(Map<String, dynamic> json) =>
    _$_TurnsLimits(
      day: json['day'] == null
          ? null
          : Day.fromJson(json['day'] as Map<String, dynamic>),
      night: json['night'] == null
          ? null
          : Day.fromJson(json['night'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_TurnsLimitsToJson(_$_TurnsLimits instance) =>
    <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'id': instance.id,
    };

_$_Day _$$_DayFromJson(Map<String, dynamic> json) => _$_Day(
      startHour: json['startHour'] as int?,
      startMinute: json['startMinute'] as int?,
      endHour: json['endHour'] as int?,
      endMinute: json['endMinute'] as int?,
    );

Map<String, dynamic> _$$_DayToJson(_$_Day instance) => <String, dynamic>{
      'startHour': instance.startHour,
      'startMinute': instance.startMinute,
      'endHour': instance.endHour,
      'endMinute': instance.endMinute,
    };
