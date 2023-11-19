// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_limited.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrentLimited _$$_CurrentLimitedFromJson(Map<String, dynamic> json) =>
    _$_CurrentLimited(
      dayLimited: json['dayLimited'] == null
          ? null
          : Limited.fromJson(json['dayLimited'] as Map<String, dynamic>),
      nightLimited: json['nightLimited'] == null
          ? null
          : Limited.fromJson(json['nightLimited'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CurrentLimitedToJson(_$_CurrentLimited instance) =>
    <String, dynamic>{
      'dayLimited': instance.dayLimited,
      'nightLimited': instance.nightLimited,
    };

_$_Limited _$$_LimitedFromJson(Map<String, dynamic> json) => _$_Limited(
      numbers:
          (json['numbers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      parlets:
          (json['parlets'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_LimitedToJson(_$_Limited instance) =>
    <String, dynamic>{
      'numbers': instance.numbers,
      'parlets': instance.parlets,
      'id': instance.id,
    };
