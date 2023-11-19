import '../../../../domain/all_players/entity/index.dart';
import '../../../player_collector/index.dart';
import '../../../player_foot_collector/index.dart';
import '../../../player_general_collector/index.dart';
import '../../index.dart';
import '../base/player_all_repository_base.dart';

class PlayerAllRepository extends PlayerAllRepositoryBase {
  @override
  Future<Map<String, dynamic>> getPlayerAllEntitiesByAscendancy() async {
    try {
      var playerAbstractEntities = <PlayerAbstractEntity>[];

      var footsCollectors =
          (await PlayerFootCollectorProvider().getPlayerFootCollector());
      if (footsCollectors['success'] != null) {
        playerAbstractEntities.addAll(
            (footsCollectors['success'] as PlayerFootCollector)
                .toDomainAbstract());

        var collectors = (await PlayerCollectorProvider().getPlayerCollector());
        if (collectors['success'] != null) {
          playerAbstractEntities.addAll(
              (collectors['success'] as PlayerCollector).toDomainAbstract());

          var generalCollectors = (await PlayerGeneralCollectorProvider()
              .getPlayerGeneralCollector());
          if (generalCollectors['success'] != null) {
            playerAbstractEntities.addAll(
                (generalCollectors['success'] as PlayerGeneralCollector)
                    .toDomainAbstract());
          } else {
            return generalCollectors;
          }
        } else {
          return collectors;
        }
      } else {
        return footsCollectors;
      }

      return {"success": playerAbstractEntities};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  @override
  Future<Map<String, dynamic>> editPlayer(
      userId,
      status,
      bool checkManageCollectorsPermit,
      bool checkManageGeneralCollectorsPermit,
      bool checkManageFootCollectorsPermit,
      bool checkManageRulesPermit,
      bool checkAssingRulePermit,
      finalRuleId,currentRuleId) {
    return PlayerProvider().editPlayer(
        userId,
        status,
        checkManageCollectorsPermit,
        checkManageGeneralCollectorsPermit,
        checkManageFootCollectorsPermit,
        checkManageRulesPermit,
        checkAssingRulePermit,
        finalRuleId,currentRuleId);
  }

  @override
  Future<Map<String, dynamic>> addPlayer(
      name, key, password, superiorId, userType) {
    return PlayerProvider()
        .addPlayer(name, key, password, superiorId, userType);
  }
}
