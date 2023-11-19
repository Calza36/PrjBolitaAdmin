import 'package:flutter/foundation.dart';
import 'package:untitled/src/domain/limitation_queue/entity/limits_entity.dart';
import 'package:untitled/src/infrastructure/limitation_config/dtos/limitated.dart';
import 'package:untitled/src/infrastructure/limitation_config/dtos/specific.dart';

import '../../../../domain/limitation_queue/entity/limitation_request.dart';
import '../../dtos/index.dart';
import '../base/limitation_queue_repository_base.dart';

class LimitationConfigRepository extends LimitationConfigRepositoryBase {
  final LimitationConfigProvider limitationQueueProvider =
      LimitationConfigProvider();

  @override
  Future<Map<String, dynamic>> getAllLimitateds() async {
    try {
      var limitationQueuesList =
          (await limitationQueueProvider.getLimitateds());
      //var limitationQueuesList = (await limitationQueueProvider.getLimited());
      if (limitationQueuesList["success"] != null) {
        var dtx = (limitationQueuesList["success"] as List<Limitated>)
            .map((e) => e.toDomain())
            .toList();

        return {"success": dtx};
      } else {
        return limitationQueuesList;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {"message": e.toString()};
    }
  }

  @override
  Future<Map<String, dynamic>> deleteLimitationQueueById(String programmingId) {
    return limitationQueueProvider.deleteLimitationById(programmingId);
  }

  @override
  Future<Map<String, dynamic>> addLimitation(
      LimitationRequestEntity limitationRequestEntity) {
    return limitationQueueProvider.addLimitationQueue(limitationRequestEntity);
  }

  @override
  Future<Map<String, dynamic>> editLimitation(
      LimitsEntity newCurrentLimitedEntity) {
    return limitationQueueProvider.editLimitationQueue(newCurrentLimitedEntity);
  }

  @override
  Future<Map<String, dynamic>> getCurrentLimitation() async {
    try {
      var limitationQueuesList =
          (await limitationQueueProvider.getCurrentLimits());
      //var limitationQueuesList = (await limitationQueueProvider.getLimited());
      if (limitationQueuesList["success"] != null) {
        var dtx = (limitationQueuesList["success"] as Specific).toDomain();
        return {"success": dtx};
      } else {
        return limitationQueuesList;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {"message": e.toString()};
    }
  }

  @override
  Future<Map<String, dynamic>> getLimitationByTurn(
      day, month, year, turn) async {
    try {
      var limitationQueuesList = (await limitationQueueProvider
          .getLimitationByTurn(day, month, year, turn));
      //var limitationQueuesList = (await limitationQueueProvider.getLimited());
      if (limitationQueuesList["success"] != null) {
        var dtx = (limitationQueuesList["success"] as Specific).toDomain();
        return {"success": dtx};
      } else {
        return limitationQueuesList;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {"message": e.toString()};
    }
  }

  @override
  Future<Map<String, dynamic>> patchNextNightLimited(
      LimitsEntity newCurrentLimitedEntity) {
    return limitationQueueProvider.editLimitationQueue(newCurrentLimitedEntity);
  }

  @override
  Future<Map<String, dynamic>> getCurrentLimited() {
    return limitationQueueProvider.getCurrentLimited();
  }

  @override
  Future<Map<String, dynamic>> getNextLimited() {
    return limitationQueueProvider.getNextLimited();
  }

  @override
  Future<Map<String, dynamic>> updateNextDayLimited(
      LimitsEntity newCurrentLimitedEntity) {
    return limitationQueueProvider
        .updateNextDayLimited(newCurrentLimitedEntity);
  }

  @override
  Future<Map<String, dynamic>> updateNextNightLimited(
      LimitsEntity newCurrentLimitedEntity) {
    return limitationQueueProvider
        .updateNextNightLimited(newCurrentLimitedEntity);
  }
}
