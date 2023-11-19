// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limitated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Limitated _$$_LimitatedFromJson(Map<String, dynamic> json) => _$_Limitated(
      id: json['id'] as String?,
      isActive: json['isActive'] as bool?,
      numbers:
          (json['numbers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      parlets:
          (json['parlets'] as List<dynamic>?)?.map((e) => e as String).toList(),
      day: json['day'] as int?,
      month: json['month'] as int?,
      turn: json['turn'] as String?,
      year: json['year'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$$_LimitatedToJson(_$_Limitated instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'numbers': instance.numbers,
      'parlets': instance.parlets,
      'day': instance.day,
      'month': instance.month,
      'turn': instance.turn,
      'year': instance.year,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
