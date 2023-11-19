import 'package:flutter/foundation.dart';

import '../../index.dart';
import '../base/player_general_collectors_repository_base.dart';

class PlayerGeneralCollectorRepository
    extends PlayerGeneralCollectorRepositoryBase {
  final PlayerGeneralCollectorProvider _playerGeneralCollectorProvider =
      PlayerGeneralCollectorProvider();
  @override
  Future<Map<String, dynamic>>
      getPlayerGeneralCollectorEntitiesByAscendancy() async {
    try {
      var allPlayerGeneralCollector =
          (await _playerGeneralCollectorProvider.getPlayerGeneralCollector());
      if (allPlayerGeneralCollector['success'] != null) {
        var dtx =
            (allPlayerGeneralCollector['success'] as PlayerGeneralCollector)
                .toDomain();
        return {'success': dtx};
      }
      return allPlayerGeneralCollector;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {'message': e.toString()};
    }
  }
}
