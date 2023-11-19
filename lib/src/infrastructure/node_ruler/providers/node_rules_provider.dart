import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../dtos/index.dart';

class NodeRuleProvider {
  String? token = GetItMock.prefs.getString('access_token');

  Future<Map<String, dynamic>> getPrivateRules() async {
    var userFather = GetItMock.prefs.getString('user_id')!;
    var httpsUri =
        Uri(scheme: PROTOCOL, host: REMOTE_ADDRESS, path: 'api/rule/privates');
    var resp = await http.get(httpsUri, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    if (resp.statusCode == 200) {
      List<dynamic> body = jsonDecode(resp.body);
      var response = Rule.fromJson(
          {"rules": body}.map((key, value) => MapEntry(key, value)));
      return {'success': response};
    } else {
      return {"message": "${resp.reasonPhrase}"};
    }
  }

  Future<Map<String, dynamic>> addAssignmentRule(
    day,
    month,
    year,
    turnToRun,
    operationType,
    targetRule,
    targetUser,
  ) async {
    return await _callAddRule(
      params: {
        "day": day,
        "month": month,
        "year": year,
        "turnToRun": "Day",
        "operationType": "Assignation",
        "targetRule": targetRule,
        "targetUser": targetUser
      },
    );
  }

  Future<Map<String, dynamic>> _callAddRule({
    required Map<String, dynamic> params,
  }) async {
    try {
      var httpsUri = Uri(
        scheme: PROTOCOL,
        host: REMOTE_ADDRESS,
        path: 'api/rule/create',
      );
      var resp = await http
          .post(httpsUri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(params))
          .timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403 || resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(resp.body);
        return {"success": body};
      } else {
        if (resp.statusCode == 400) {
          var body = jsonDecode(resp.body);
          return {"message": "Algo salió mal.\n"};
        } else if (resp.statusCode == 403 || resp.statusCode == 500) {
          return {"message": "Autenticar."};
        } else {
          return {"message": "Algo salió mal."};
        }
      }
    } catch (e) {
      return {"message": "Algo salió mal. Verifique el acceso al servidor."};
    }
    //print('DeleteProductByPk -> ' + result.operation! + ' ' + result// .message!);
  }
}
