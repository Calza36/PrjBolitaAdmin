// To parse this JSON data, do
//
//     final childrensDto = childrensDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'childrens_dto.freezed.dart';
part 'childrens_dto.g.dart';

ChildrensDto childrensDtoFromJson(String str) => ChildrensDto.fromJson(json.decode(str));

String childrensDtoToJson(ChildrensDto data) => json.encode(data.toJson());

@freezed
class ChildrensDto with _$ChildrensDto {
  const factory ChildrensDto({
    List<Child>? children,
  }) = _ChildrensDto;

  factory ChildrensDto.fromJson(Map<String, dynamic> json) => _$ChildrensDtoFromJson(json);
}

@freezed
class Child with _$Child {
  const factory Child({
    String? id,
    String? name,
    String? key,
    String? status,
    String? userType,
  }) = _Child;

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
}
