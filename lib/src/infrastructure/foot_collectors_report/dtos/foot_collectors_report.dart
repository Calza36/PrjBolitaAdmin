// To parse this JSON data, do
//
//     final footCollectorsReport = footCollectorsReportFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/foot_collector_report/entity/foot_collector_report_entity.dart';

part 'foot_collectors_report.freezed.dart';
part 'foot_collectors_report.g.dart';

FootCollectorsReport footCollectorsReportFromJson(String str) =>
    FootCollectorsReport.fromJson(json.decode(str));

String footCollectorsReportToJson(FootCollectorsReport data) =>
    json.encode(data.toJson());

@freezed
class FootCollectorsReport with _$FootCollectorsReport {
  const factory FootCollectorsReport({
    List<FootCollectorsReportElement>? footCollectorsReport,
  }) = _FootCollectorsReport;

  factory FootCollectorsReport.fromJson(Map<String, dynamic> json) =>
      _$FootCollectorsReportFromJson(json);
}

@freezed
class FootCollectorsReportElement with _$FootCollectorsReportElement {
  const factory FootCollectorsReportElement({
    String? id,
    int? clean,
    int? prize,
    int? wins,
    int? loses,
  }) = _FootCollectorsReportElement;

  factory FootCollectorsReportElement.fromJson(Map<String, dynamic> json) =>
      _$FootCollectorsReportElementFromJson(json);
}

extension FootCollectorsReportDtoX on FootCollectorsReport {
  List<FootCollectorReportEntity> toDomain() {
    return footCollectorsReport!
        .map((reportElement) => FootCollectorReportEntity(
            reportElement.id!,
            reportElement.clean!,
            reportElement.prize!,
            reportElement.wins!,
            reportElement.loses!))
        .toList();
  }
}
