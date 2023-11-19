// import 'package:flutter/foundation.dart';
//
// import '../../../../domain/limitation_queue/entity/limitation_request.dart';
// import '../../dtos/index.dart';
// import '../../dtos/limitation_queue.dart';
// import '../../dtos/limited.dart';
// import '../base/limitation_queue_repository_base.dart';
//
// class LimitationQueueRepository extends LimitationQueueRepositoryBase {
//   final ShootProvider limitationQueueProvider = ShootProvider();
//
//   @override
//   Future<Map<String, dynamic>> getAllLimitationsQueue() async {
//     try {
//       var limitationQueuesList =
//           (await limitationQueueProvider.getLimitationQueue());
//       //var limitationQueuesList = (await limitationQueueProvider.getLimited());
//       if (limitationQueuesList["success"] != null) {
//         var dtx =
//             (limitationQueuesList["success"] as LimitationQueue).toDomain();
//         return {"success": dtx};
//       } else {
//         return limitationQueuesList;
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return {"message": e.toString()};
//     }
//   }
//
//   @override
//   Future<bool?> deleteLimitationQueueById(String programmingId) {
//     return limitationQueueProvider.deleteLimitationQueueById(programmingId);
//   }
//
//   @override
//   Future<Map<String, dynamic>> addLimitationQueueById(
//       LimitationRequestEntity limitationRequestEntity) {
//     return limitationQueueProvider.addLimitationQueue(limitationRequestEntity);
//   }
//
//   @override
//   Future<Map<String, dynamic>> getCurrentLimitation() async {
//     try {
//       var limitationQueuesList =
//           (await limitationQueueProvider.getCurrentLimits());
//       //var limitationQueuesList = (await limitationQueueProvider.getLimited());
//       if (limitationQueuesList["success"] != null) {
//         var dtx = (limitationQueuesList["success"] as Limited).toDomain();
//         return {"success": dtx};
//       } else {
//         return limitationQueuesList;
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return {"message": e.toString()};
//     }
//   }
// }
