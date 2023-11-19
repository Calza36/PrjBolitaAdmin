// To parse this JSON data, do
//
//     final player = playerFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/services/get_it_mock.dart';
import '../../../domain/all_players/entity/index.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    String? id,
    String? name,
    String? userType,
    List<Child>? children,
    String? status,
    bool? createUserPermit,
    bool? editUserPermit,
    bool? deleteUserPermit,
    bool? manageRulesPermit,
    bool? assingRulePermit,
    bool? manageGeneralCollectorsPermit,
    bool? manageCollectorsPermit,
    bool? manageFootCollectorsPermit,
    String? personalRule
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

@freezed
class Child with _$Child {
  const factory Child({
    String? id,
    String? name,
    String? userType,
  }) = _Child;

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
}

extension PlayerDtoX on Player {
  PlayerAbstractEntity toDomain() {
    return PlayerAbstractEntity(
      id!,
      GetItMock.getMyRule(id!).id!,
      name!,
      GetItMock.getMyRule(id!).name!,
      status!,
      userType!,
      personalRule!,
      manageRulesPermit: manageRulesPermit,
      assingRulePermit: assingRulePermit,
      manageCollectorsPermit: manageCollectorsPermit,
      manageFootCollectorsPermit: manageFootCollectorsPermit,
      manageGeneralCollectorsPermit: manageGeneralCollectorsPermit,
    );
  }
}
