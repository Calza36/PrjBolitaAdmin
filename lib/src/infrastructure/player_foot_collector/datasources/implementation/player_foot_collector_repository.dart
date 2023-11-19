import 'package:flutter/foundation.dart';

import '../../index.dart';
import '../base/player_foot_collectors_reports_repository_base.dart';

class PlayerFootCollectorRepository extends PlayerFootCollectorRepositoryBase {
  final PlayerFootCollectorProvider _playerFootCollectorProvider =
      PlayerFootCollectorProvider();
  @override
  Future<Map<String, dynamic>>
      getPlayerFootCollectorEntitiesByAscendancy() async {
    try {
      var allPlayerFootCollector =
          (await _playerFootCollectorProvider.getPlayerFootCollector());

      if (allPlayerFootCollector['success'] != null) {
        var dtx = (allPlayerFootCollector['success'] as PlayerFootCollector)
            .toDomain();
        return {"success": dtx};
      } else {
        return allPlayerFootCollector;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {"message": e.toString()};
    }
  }

  @override
  Future<Map> deletePlayer(String userId) {
    return _playerFootCollectorProvider.deletePlayer(userId);
  }
}
