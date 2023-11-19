// To parse this JSON data, do
//
//     final playerGeneralCollector = playerGeneralCollectorFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled/src/data/services/get_it_mock.dart';

import '../../../domain/all_players/entity/index.dart';
import '../../../domain/player_general_collector/entity/index.dart';

part 'player_general_collector.freezed.dart';
part 'player_general_collector.g.dart';

PlayerGeneralCollector playerGeneralCollectorFromJson(String str) =>
    PlayerGeneralCollector.fromJson(json.decode(str));

String playerGeneralCollectorToJson(PlayerGeneralCollector data) =>
    json.encode(data.toJson());

@freezed
class PlayerGeneralCollector with _$PlayerGeneralCollector {
  const factory PlayerGeneralCollector({
    List<GeneralCollector>? generalCollectors,
  }) = _PlayerGeneralCollector;

  factory PlayerGeneralCollector.fromJson(Map<String, dynamic> json) =>
      _$PlayerGeneralCollectorFromJson(json);
}

@freezed
class GeneralCollector with _$GeneralCollector {
  const factory GeneralCollector({
    String? id,
    String? name,
    String? status,
    String? userType,
  }) = _GeneralCollector;

  factory GeneralCollector.fromJson(Map<String, dynamic> json) =>
      _$GeneralCollectorFromJson(json);
}

extension PlayerGeneralCollectorDtoX on PlayerGeneralCollector {
  List<PlayerGeneralCollectorEntity> toDomain() {
    return generalCollectors!
        .map((generalCollector) => PlayerGeneralCollectorEntity(
            id: generalCollector.id!,
            name: generalCollector.name!,
            status: generalCollector.status!,
            userType: generalCollector.userType!,
            rule: GetItMock.getMyRule(generalCollector.id!)))
        .toList();
  }

  List<PlayerAbstractEntity> toDomainAbstract() {
    return generalCollectors!
        .map((generalCollector) => PlayerAbstractEntity(
            generalCollector.id!,
            generalCollector.id!,
            generalCollector.name!,
            generalCollector.id!,
            generalCollector.status!,
            generalCollector.userType!,""))
        .toList();
  }
}
