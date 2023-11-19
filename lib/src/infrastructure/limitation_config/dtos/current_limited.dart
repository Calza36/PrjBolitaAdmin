// To parse this JSON data, do
//
//     final currentLimited = currentLimitedFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'current_limited.freezed.dart';
part 'current_limited.g.dart';

@freezed
class CurrentLimited with _$CurrentLimited {
  const factory CurrentLimited({
    Limited? dayLimited,
    Limited? nightLimited,
  }) = _CurrentLimited;

  factory CurrentLimited.fromJson(Map<String, dynamic> json) => _$CurrentLimitedFromJson(json);
}

@freezed
class Limited with _$Limited {
  const factory Limited({
    List<String>? numbers,
    List<String>? parlets,
    String? id,
  }) = _Limited;

  factory Limited.fromJson(Map<String, dynamic> json) => _$LimitedFromJson(json);
}
