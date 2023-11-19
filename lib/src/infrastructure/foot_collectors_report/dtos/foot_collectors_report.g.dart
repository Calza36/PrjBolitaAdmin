// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foot_collectors_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FootCollectorsReport _$$_FootCollectorsReportFromJson(
        Map<String, dynamic> json) =>
    _$_FootCollectorsReport(
      footCollectorsReport: (json['footCollectorsReport'] as List<dynamic>?)
          ?.map((e) =>
              FootCollectorsReportElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FootCollectorsReportToJson(
        _$_FootCollectorsReport instance) =>
    <String, dynamic>{
      'footCollectorsReport': instance.footCollectorsReport,
    };

_$_FootCollectorsReportElement _$$_FootCollectorsReportElementFromJson(
        Map<String, dynamic> json) =>
    _$_FootCollectorsReportElement(
      id: json['id'] as String?,
      clean: json['clean'] as int?,
      prize: json['prize'] as int?,
      wins: json['wins'] as int?,
      loses: json['loses'] as int?,
    );

Map<String, dynamic> _$$_FootCollectorsReportElementToJson(
        _$_FootCollectorsReportElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clean': instance.clean,
      'prize': instance.prize,
      'wins': instance.wins,
      'loses': instance.loses,
    };
