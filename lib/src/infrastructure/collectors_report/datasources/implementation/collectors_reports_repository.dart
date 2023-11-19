import '../../../childrens/index.dart';
import '../../index.dart';
import '../base/collectors_reports_repository_base.dart';

class CollectorsReportsRepository extends CollectorsReportsRepositoryBase {
  final CollectorsReportsProvider _collectorsReportsProvider =
      CollectorsReportsProvider();
  final ChildrensProvider _childrensProvider = ChildrensProvider();

  @override
  Future<Map<String, dynamic>> getCollectorsReportEntityByCollectorId(
      collectorId, turn, day, month, year) async {
    try {
      var allCollectorsReports = (await _collectorsReportsProvider
          .getAllCollectorsReports(collectorId, turn, day, month, year));
      var myChildrens =
          (await _childrensProvider.getMyChildrens(collectorId)).children;

      if (allCollectorsReports["success"] != null) {
        var dtx = allCollectorsReports["success"]!.toDomain();
        for (var collectorsReport in dtx) {
          for (var child in myChildrens!) {
            if (collectorsReport.id == child.id) {
              dtx.elementAt(dtx.indexOf(collectorsReport)).name = child.name;
              break;
            }
          }
        }
      }
      return allCollectorsReports;
    } catch (e) {
      return {"message": "Algo salió mal."};
    }
  }
}
