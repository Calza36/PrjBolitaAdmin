// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_collectors_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeneralCollectorsReport _$$_GeneralCollectorsReportFromJson(
        Map<String, dynamic> json) =>
    _$_GeneralCollectorsReport(
      generalCollectorsReport:
          (json['generalCollectorsReport'] as List<dynamic>?)
              ?.map((e) => GeneralCollectorsReportElement.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_GeneralCollectorsReportToJson(
        _$_GeneralCollectorsReport instance) =>
    <String, dynamic>{
      'generalCollectorsReport': instance.generalCollectorsReport,
    };

_$_GeneralCollectorsReportElement _$$_GeneralCollectorsReportElementFromJson(
        Map<String, dynamic> json) =>
    _$_GeneralCollectorsReportElement(
      id: json['id'] as String?,
      clean: json['clean'] as int?,
      prize: json['prize'] as int?,
      wins: json['wins'] as int?,
      loses: json['loses'] as int?,
      salary: json['salary'] as int?,
    );

Map<String, dynamic> _$$_GeneralCollectorsReportElementToJson(
        _$_GeneralCollectorsReportElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clean': instance.clean,
      'prize': instance.prize,
      'wins': instance.wins,
      'loses': instance.loses,
      'salary': instance.salary,
    };
