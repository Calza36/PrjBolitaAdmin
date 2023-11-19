// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_general_collector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerGeneralCollector _$$_PlayerGeneralCollectorFromJson(
        Map<String, dynamic> json) =>
    _$_PlayerGeneralCollector(
      generalCollectors: (json['generalCollectors'] as List<dynamic>?)
          ?.map((e) => GeneralCollector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlayerGeneralCollectorToJson(
        _$_PlayerGeneralCollector instance) =>
    <String, dynamic>{
      'generalCollectors': instance.generalCollectors,
    };

_$_GeneralCollector _$$_GeneralCollectorFromJson(Map<String, dynamic> json) =>
    _$_GeneralCollector(
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$$_GeneralCollectorToJson(_$_GeneralCollector instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'userType': instance.userType,
    };
