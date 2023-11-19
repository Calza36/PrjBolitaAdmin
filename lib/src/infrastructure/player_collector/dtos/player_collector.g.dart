// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_collector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerCollector _$$_PlayerCollectorFromJson(Map<String, dynamic> json) =>
    _$_PlayerCollector(
      collectors: (json['collectors'] as List<dynamic>?)
          ?.map((e) => Collector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlayerCollectorToJson(_$_PlayerCollector instance) =>
    <String, dynamic>{
      'collectors': instance.collectors,
    };

_$_Collector _$$_CollectorFromJson(Map<String, dynamic> json) => _$_Collector(
      id: json['id'] as String?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      status: json['status'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$$_CollectorToJson(_$_Collector instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'key': instance.key,
      'status': instance.status,
      'userType': instance.userType,
    };
