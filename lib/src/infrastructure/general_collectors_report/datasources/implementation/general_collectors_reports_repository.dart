import '../../../childrens/index.dart';
import '../../dtos/general_collectors_report.dart';
import '../../dtos/index.dart';
import '../base/general_collectors_reports_repository_base.dart';

class GeneralCollectorsReportsRepository
    extends GeneralCollectorsReportsRepositoryBase {
  final GeneralCollectorsReportsProvider generalCollectorsReportsProvider =
      GeneralCollectorsReportsProvider();
  final ChildrensProvider _childrensProvider = ChildrensProvider();

  @override
  Future<Map<String, dynamic>> getGeneralCollectorsReportEntityByAdminId(
      adminId, turn, day, month, year) async {
    try {
      var generalCollectorsReports = (await generalCollectorsReportsProvider
          .getGeneralCollectorsReports(adminId, turn, day, month, year));

      if (generalCollectorsReports["success"] != null) {
        var myChildrens =
            (await _childrensProvider.getMyChildrens(adminId)).children;

        var dtx =
            (generalCollectorsReports["success"] as GeneralCollectorsReport)
                .toDomain();
        for (var generalCollectorsReport in dtx) {
          for (var child in myChildrens!) {
            if (generalCollectorsReport.id == child.id) {
              dtx.elementAt(dtx.indexOf(generalCollectorsReport)).name =
                  child.name;
              break;
            } else {
              dtx.elementAt(dtx.indexOf(generalCollectorsReport)).name =
                  generalCollectorsReport.id;
            }
          }
        }
        return {"success": dtx};
      } else {
        return generalCollectorsReports;
      }
      //Delete Reports of not my child
      /*if (allFootCollectorsReports.footCollectorsReport != null &&
          myChildrens != null) {
        allFootCollectorsReports.footCollectorsReport!.removeWhere(
            (footCollectorsReport) => !myChildrens
                .any((children) => children.id! == footCollectorsReport.id!));
      } */
    } catch (e) {
      return {"message": e};
    }
  }
}
