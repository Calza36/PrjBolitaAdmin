// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limited.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Limited _$$_LimitedFromJson(Map<String, dynamic> json) => _$_Limited(
      id: json['id'] as String?,
      isActive: json['isActive'] as bool?,
      numbers:
          (json['numbers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      parlets:
          (json['parlets'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_LimitedToJson(_$_Limited instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'numbers': instance.numbers,
      'parlets': instance.parlets,
    };
