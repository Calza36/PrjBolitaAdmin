// To parse this JSON data, do
//
//     final limitated = limitatedFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/limitation_queue/entity/index.dart';

part 'limitated.freezed.dart';
part 'limitated.g.dart';

List<Limitated> limitatedFromJson(String str) =>
    List<Limitated>.from(json.decode(str).map((x) => Limitated.fromJson(x)));

String limitatedToJson(List<Limitated> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Limitated with _$Limitated {
  const factory Limitated({
    String? id,
    bool? isActive,
    List<String>? numbers,
    List<String>? parlets,
    int? day,
    int? month,
    String? turn,
    int? year,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) = _Limitated;

  factory Limitated.fromJson(Map<String, dynamic> json) =>
      _$LimitatedFromJson(json);
}

extension LimitationQueueDtoX on Limitated {
  LimitatedEntity toDomain() {
    return LimitatedEntity(
      id!,
      isActive!,
      numbers,
      parlets,
      day,
      month,
      turn,
      year,
    );
  }
}
