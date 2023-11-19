// To parse this JSON data, do
//
//     final specific = specificFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled/src/domain/limitation_queue/entity/limits_entity.dart';

part 'specific.freezed.dart';
part 'specific.g.dart';

Specific specificFromJson(String str) => Specific.fromJson(json.decode(str));

String specificToJson(Specific data) => json.encode(data.toJson());

@freezed
class Specific with _$Specific {
  const factory Specific({
    String? id,
    List<String>? numbers,
    List<String>? parlets,
  }) = _Specific;

  factory Specific.fromJson(Map<String, dynamic> json) =>
      _$SpecificFromJson(json);
}

extension SpecificDtoX on Specific {
  LimitsEntity toDomain() {
    return LimitsEntity(
      numbers: numbers,
      parlets: parlets,
    );
  }
}
