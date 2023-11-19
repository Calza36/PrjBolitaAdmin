// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Specific _$$_SpecificFromJson(Map<String, dynamic> json) => _$_Specific(
      id: json['id'] as String?,
      numbers:
          (json['numbers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      parlets:
          (json['parlets'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_SpecificToJson(_$_Specific instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numbers': instance.numbers,
      'parlets': instance.parlets,
    };
