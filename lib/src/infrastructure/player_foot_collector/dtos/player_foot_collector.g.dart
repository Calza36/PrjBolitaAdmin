// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_foot_collector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerFootCollector _$$_PlayerFootCollectorFromJson(
        Map<String, dynamic> json) =>
    _$_PlayerFootCollector(
      footCollectors: (json['footCollectors'] as List<dynamic>?)
          ?.map((e) => FootCollector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlayerFootCollectorToJson(
        _$_PlayerFootCollector instance) =>
    <String, dynamic>{
      'footCollectors': instance.footCollectors,
    };

_$_FootCollector _$$_FootCollectorFromJson(Map<String, dynamic> json) =>
    _$_FootCollector(
      id: json['id'] as String?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      status: json['status'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$$_FootCollectorToJson(_$_FootCollector instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'key': instance.key,
      'status': instance.status,
      'userType': instance.userType,
    };
