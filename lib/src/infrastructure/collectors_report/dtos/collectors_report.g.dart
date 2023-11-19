// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectors_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CollectorsReport _$$_CollectorsReportFromJson(Map<String, dynamic> json) =>
    _$_CollectorsReport(
      collectorsReport: (json['collectorsReport'] as List<dynamic>?)
          ?.map((e) =>
              CollectorsReportElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CollectorsReportToJson(_$_CollectorsReport instance) =>
    <String, dynamic>{
      'collectorsReport': instance.collectorsReport,
    };

_$_CollectorsReportElement _$$_CollectorsReportElementFromJson(
        Map<String, dynamic> json) =>
    _$_CollectorsReportElement(
      id: json['id'] as String?,
      clean: json['clean'] as int?,
      prize: json['prize'] as int?,
      wins: json['wins'] as int?,
      loses: json['loses'] as int?,
      salary: json['salary'] as int?,
    );

Map<String, dynamic> _$$_CollectorsReportElementToJson(
        _$_CollectorsReportElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clean': instance.clean,
      'prize': instance.prize,
      'wins': instance.wins,
      'loses': instance.loses,
      'salary': instance.salary,
    };
