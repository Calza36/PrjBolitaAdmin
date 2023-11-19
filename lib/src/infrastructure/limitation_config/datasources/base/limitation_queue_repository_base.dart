import 'package:untitled/src/domain/limitation_queue/entity/limits_entity.dart';

import '../../../../domain/limitation_queue/entity/limitation_request.dart';

abstract class LimitationConfigRepositoryBase {
  Future<Map<String, dynamic>> getAllLimitateds();

  Future<Map<String, dynamic>> getCurrentLimitation();

  Future<Map<String, dynamic>> getLimitationByTurn(day, month, year, turn);

  Future<Map<String, dynamic>> addLimitation(
      LimitationRequestEntity limitationRequestEntity);

  Future<Map<String, dynamic>> editLimitation(
      LimitsEntity newCurrentLimitedEntity);

  Future<Map<String, dynamic>> deleteLimitationQueueById(String programmingId);

  Future<Map<String, dynamic>> updateNextDayLimited(
      LimitsEntity newCurrentLimitedEntity);

  Future<Map<String, dynamic>> updateNextNightLimited(
      LimitsEntity newCurrentLimitedEntity);

  Future<Map<String, dynamic>> getCurrentLimited();

  Future<Map<String, dynamic>> getNextLimited();
}
