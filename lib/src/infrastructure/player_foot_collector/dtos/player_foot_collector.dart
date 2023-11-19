// To parse this JSON data, do
//
//     final playerFootCollector = playerFootCollectorFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/services/get_it_mock.dart';
import '../../../domain/all_players/entity/index.dart';
import '../../../domain/player_foot_collector/entity/index.dart';

part 'player_foot_collector.freezed.dart';
part 'player_foot_collector.g.dart';

PlayerFootCollector playerFootCollectorFromJson(String str) =>
    PlayerFootCollector.fromJson(json.decode(str));

String playerFootCollectorToJson(PlayerFootCollector data) =>
    json.encode(data.toJson());

@freezed
class PlayerFootCollector with _$PlayerFootCollector {
  const factory PlayerFootCollector({
    List<FootCollector>? footCollectors,
  }) = _PlayerFootCollector;

  factory PlayerFootCollector.fromJson(Map<String, dynamic> json) =>
      _$PlayerFootCollectorFromJson(json);
}

@freezed
class FootCollector with _$FootCollector {
  const factory FootCollector({
    String? id,
    String? name,
    String? key,
    String? status,
    String? userType,
  }) = _FootCollector;

  factory FootCollector.fromJson(Map<String, dynamic> json) =>
      _$FootCollectorFromJson(json);
}

extension PlayerFootCollectorDtoX on PlayerFootCollector {
  List<PlayerFootCollectorEntity> toDomain() {
    return footCollectors!
        .map((footCollector) => PlayerFootCollectorEntity(
            id: footCollector.id!,
            name: footCollector.name!,
            key: footCollector.key!,
            status: footCollector.status!,
            userType: footCollector.userType!,
            rule: GetItMock.getMyRule(footCollector.id!)))
        .toList();
  }

  List<PlayerAbstractEntity> toDomainAbstract() {
    return footCollectors!.map((footCollector) {
      return PlayerAbstractEntity(
        footCollector.id!,
        GetItMock.getMyRule(footCollector.id!).id!,
        footCollector.name!,
        GetItMock.getMyRule(footCollector.id!).name!,
        footCollector.status!,
        footCollector.userType!,""
      );
    }).toList();
  }
}
