// To parse this JSON data, do
//
//     final limited = limitedFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'limited.freezed.dart';
part 'limited.g.dart';

List<Limited> limitedFromJson(String str) =>
    List<Limited>.from(json.decode(str).map((x) => Limited.fromJson(x)));

String limitedToJson(List<Limited> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Limited with _$Limited {
  const factory Limited({
    String? id,
    bool? isActive,
    List<String>? numbers,
    List<String>? parlets,
  }) = _Limited;

  factory Limited.fromJson(Map<String, dynamic> json) =>
      _$LimitedFromJson(json);
}
