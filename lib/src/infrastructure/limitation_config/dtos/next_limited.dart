// To parse this JSON data, do
//
//     final nextLimited = nextLimitedFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_limited.freezed.dart';
part 'next_limited.g.dart';

@freezed
class NextLimited with _$NextLimited {
  const factory NextLimited({
    Limited? dayLimited,
    Limited? nightLimited,
  }) = _NextLimited;

  factory NextLimited.fromJson(Map<String, dynamic> json) => _$NextLimitedFromJson(json);
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
