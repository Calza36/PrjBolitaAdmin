// To parse this JSON data, do
//
//     final collectorsReport = collectorsReportFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/collector_report/entity/collector_report_entity.dart';

part 'collectors_report.freezed.dart';
part 'collectors_report.g.dart';

CollectorsReport collectorsReportFromJson(String str) =>
    CollectorsReport.fromJson(json.decode(str));

String collectorsReportToJson(CollectorsReport data) =>
    json.encode(data.toJson());

@freezed
class CollectorsReport with _$CollectorsReport {
  const factory CollectorsReport({
    List<CollectorsReportElement>? collectorsReport,
  }) = _CollectorsReport;

  factory CollectorsReport.fromJson(Map<String, dynamic> json) =>
      _$CollectorsReportFromJson(json);
}

@freezed
class CollectorsReportElement with _$CollectorsReportElement {
  const factory CollectorsReportElement({
    String? id,
    int? clean,
    int? prize,
    int? wins,
    int? loses,
    int? salary,
  }) = _CollectorsReportElement;

  factory CollectorsReportElement.fromJson(Map<String, dynamic> json) =>
      _$CollectorsReportElementFromJson(json);
}

extension CollectorsReportDtoX on CollectorsReport {
  List<CollectorReportEntity> toDomain() {
    return collectorsReport!
        .map((reportElement) => CollectorReportEntity(
            reportElement.id!,
            reportElement.clean!,
            reportElement.prize!,
            reportElement.wins!,
            reportElement.loses!,
            reportElement.salary!))
        .toList();
  }
}
