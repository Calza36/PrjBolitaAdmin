// To parse this JSON data, do
//
//     final playerCollector = playerCollectorFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/services/get_it_mock.dart';
import '../../../domain/all_players/entity/index.dart';
import '../../../domain/player_collector/entity/index.dart';

part 'player_collector.freezed.dart';
part 'player_collector.g.dart';

PlayerCollector playerCollectorFromJson(String str) =>
    PlayerCollector.fromJson(json.decode(str));

String playerCollectorToJson(PlayerCollector data) =>
    json.encode(data.toJson());

@freezed
class PlayerCollector with _$PlayerCollector {
  const factory PlayerCollector({
    List<Collector>? collectors,
  }) = _PlayerCollector;

  factory PlayerCollector.fromJson(Map<String, dynamic> json) =>
      _$PlayerCollectorFromJson(json);
}

@freezed
class Collector with _$Collector {
  const factory Collector({
    String? id,
    String? name,
    String? key,
    String? status,
    String? userType,
  }) = _Collector;

  factory Collector.fromJson(Map<String, dynamic> json) =>
      _$CollectorFromJson(json);
}

extension PlayerFootCollectorDtoX on PlayerCollector {
  List<PlayerCollectorEntity> toDomain() {
    return collectors!
        .map((collector) => PlayerCollectorEntity(
            id: collector.id!,
            name: collector.name!,
            key: collector.key!,
            status: collector.status!,
            userType: collector.userType!,
            rule: GetItMock.getMyRule(collector.id!)))
        .toList();
  }

  List<PlayerAbstractEntity> toDomainAbstract() {
    return collectors!
        .map((collector) => PlayerAbstractEntity(
            collector.id!,
            collector.id!,
            collector.name!,
            collector.id!,
            collector.status!,
            collector.userType!,""))
        .toList();
  }
}
