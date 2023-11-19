import '../../../../domain/limitation_queue/entity/limitation_request.dart';

abstract class LimitationQueueRepositoryBase {
  Future<Map<String, dynamic>> getAllLimitationsQueue();
  Future<Map<String, dynamic>> getCurrentLimitation();
  Future<Map<String, dynamic>> addLimitationQueueById(
      LimitationRequestEntity limitationRequestEntity);
  Future<bool?> deleteLimitationQueueById(String programmingId);
}
