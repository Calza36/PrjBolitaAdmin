// To parse this JSON data, do
//
//     final limited = limitedFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'limited.freezed.dart';
part 'limited.g.dart';

Limited limitedFromJson(String str) => Limited.fromJson(json.decode(str));

String limitedToJson(Limited data) => json.encode(data.toJson());

@freezed
class Limited with _$Limited {
  const factory Limited({
    List<String>? numbers,
    List<String>? parlets,
  }) = _Limited;

  factory Limited.fromJson(Map<String, dynamic> json) =>
      _$LimitedFromJson(json);
}
