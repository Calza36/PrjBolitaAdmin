import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../dtos/index.dart';

class CollectorsReportsProvider {
  String? token = GetItMock.prefs.getString('access_token');

  Future<Map<String, dynamic>> getAllCollectorsReports(
      collectorId, turn, day, month, year) async {
    //lotery-gamma.vercel.app/api/turnReport/collectors?year=2022&month=12&day=19&turn=day.dart

    var httpsUri = Uri(
        scheme: PROTOCOL,
        host: REMOTE_ADDRESS,
        path: 'api/turnReport/collectors',
        queryParameters: {
          "userId": collectorId,
          "turn": turn,
          "day": day,
          "month": month,
          "year": year
        }.map((key, value) => MapEntry(key, value.toString())));

    var resp = await http.get(httpsUri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    Map<String, dynamic> body = jsonDecode(resp.body);
    if (resp.statusCode == 403 || resp.statusCode == 500) {
      return {"message": "Autenticar."};
    } else if (resp.statusCode == 200) {
      var result = CollectorsReport.fromJson(body);
      return {"success": result};
    }
    return body;
  }
}
