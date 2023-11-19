abstract class CollectorsReportsRepositoryBase {
  Future<Map<String, dynamic>> getCollectorsReportEntityByCollectorId(
      collectorId, turn, day, month, year);
}
