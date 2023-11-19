// To parse this JSON data, do
//
//     final generalCollectorsReport = generalCollectorsReportFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/general_collector_report/entity/foot_collector_report_entity.dart';

part 'general_collectors_report.freezed.dart';
part 'general_collectors_report.g.dart';

GeneralCollectorsReport generalCollectorsReportFromJson(String str) =>
    GeneralCollectorsReport.fromJson(json.decode(str));

String generalCollectorsReportToJson(GeneralCollectorsReport data) =>
    json.encode(data.toJson());

@freezed
class GeneralCollectorsReport with _$GeneralCollectorsReport {
  const factory GeneralCollectorsReport({
    List<GeneralCollectorsReportElement>? generalCollectorsReport,
  }) = _GeneralCollectorsReport;

  factory GeneralCollectorsReport.fromJson(Map<String, dynamic> json) =>
      _$GeneralCollectorsReportFromJson(json);
}

@freezed
class GeneralCollectorsReportElement with _$GeneralCollectorsReportElement {
  const factory GeneralCollectorsReportElement({
    String? id,
    int? clean,
    int? prize,
    int? wins,
    int? loses,
    int? salary,
  }) = _GeneralCollectorsReportElement;

  factory GeneralCollectorsReportElement.fromJson(Map<String, dynamic> json) =>
      _$GeneralCollectorsReportElementFromJson(json);
}

extension GeneralCollectorsReportDtoX on GeneralCollectorsReport {
  List<GeneralCollectorReportEntity> toDomain() {
    return generalCollectorsReport!
        .map((reportElement) => GeneralCollectorReportEntity(
            reportElement.id!,
            reportElement.clean!,
            reportElement.prize!,
            reportElement.wins!,
            reportElement.loses!,
            reportElement.salary!))
        .toList();
  }
}
