abstract class FootCollectorsReportsRepositoryBase {
  Future<Map<String, dynamic>> getFootCollectorsReportEntityByCollectorId(
      collectorId, turn, day, month, year);
}
