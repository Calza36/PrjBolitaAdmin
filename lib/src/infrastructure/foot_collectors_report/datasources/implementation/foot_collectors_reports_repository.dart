import '../../../childrens/index.dart';
import '../../index.dart';
import '../base/foot_collectors_reports_repository_base.dart';

class FootCollectorsReportsRepository
    extends FootCollectorsReportsRepositoryBase {
  final FootCollectorsReportsProvider _footCollectorsReportsProvider =
      FootCollectorsReportsProvider();
  final ChildrensProvider _childrensProvider = ChildrensProvider();

  @override
  Future<Map<String, dynamic>> getFootCollectorsReportEntityByCollectorId(
      collectorId, turn, day, month, year) async {
    try {
      var allFootCollectorsReports = (await _footCollectorsReportsProvider
          .getAllFootCollectorsReports(collectorId, turn, day, month, year));
      var myChildrens =
          (await _childrensProvider.getMyChildrens(collectorId)).children;

      if (allFootCollectorsReports["success"] != null) {
        var dtx = (allFootCollectorsReports["success"] as FootCollectorsReport)
            .toDomain();
        for (var footCollectorsReport in dtx) {
          for (var child in myChildrens!) {
            if (footCollectorsReport.id == child.id) {
              dtx.elementAt(dtx.indexOf(footCollectorsReport)).name =
                  child.name;
              break;
            } else {
              dtx.elementAt(dtx.indexOf(footCollectorsReport)).name =
                  footCollectorsReport.id;
              break;
            }
          }
        }

        return {"success": dtx};
      } else {
        return allFootCollectorsReports;
      }
    } catch (e) {
      return {"message": "Algo salió mal."};
    }
  }

  getFootCollectorsReportsElementsByAdminId(
      String s, String turn, int day, int month, int year) {
    //Todo
  }

  getFootCollectorsReportElementsByGeneralCollectorId(
      String s, String turn, int day, int month, int year) {
    //Todo
  }
}
