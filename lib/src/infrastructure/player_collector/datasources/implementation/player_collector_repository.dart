import 'package:flutter/foundation.dart';

import '../../index.dart';
import '../base/player_collectors_reports_repository_base.dart';

class PlayerCollectorRepository extends PlayerCollectorRepositoryBase {
  final PlayerCollectorProvider _playerCollectorProvider =
      PlayerCollectorProvider();
  @override
  Future<Map<String, dynamic>> getPlayerCollectorEntitiesByAscendancy() async {
    try {
      var allPlayerCollector =
          (await _playerCollectorProvider.getPlayerCollector());
      if (allPlayerCollector['success'] != null) {
        var dtx = (allPlayerCollector['success'] as PlayerCollector).toDomain();
        return {'success': dtx};
      } else {
        return allPlayerCollector;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {'message': e.toString()};
    }
  }
}
