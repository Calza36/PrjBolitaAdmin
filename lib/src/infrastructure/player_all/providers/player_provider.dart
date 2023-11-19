import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../dtos/index.dart';

class PlayerProvider {
  String? token = GetItMock.prefs.getString('access_token');

  Future<Player?> getPlayer(String idUser) async {
    var httpsUri = Uri(
        scheme: PROTOCOL,
        host: REMOTE_ADDRESS,
        path: 'api/user',
        queryParameters: {
          "userId": idUser,
        }.map((key, value) => MapEntry(key, value.toString())));

    var resp = await http.get(httpsUri, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    var body = jsonDecode(resp.body);
    var response = Player.fromJson(body);
    return response;
  }

  Future<Map<String, dynamic>> editPlayer(
      userId,
      status,
      checkManageCollectorsPermit,
      checkManageGeneralCollectorsPermit,
      checkManageFootCollectorsPermit,
      checkManageRulesPermit,
      checkAssingRulePermit,
      finalRuleId,
      currentRuleId) async {
    var httpsUriUserUpdate = Uri(
      scheme: PROTOCOL,
      host: REMOTE_ADDRESS,
      path: 'api/user/update',
    );
    var httpsUriRule = Uri(
      scheme: PROTOCOL,
      host: REMOTE_ADDRESS,
      path: 'api/rulingQueue',
    );
    http.Response? respRule;
    if (finalRuleId != currentRuleId) {
      Map<String, dynamic> authDataForRule = {
        "day": '',
        "month": '',
        "year": '',
        "turnToRun": "",
        "operationType": "",
        "targetRule": "",
        "targetUser": ""
      };

      authDataForRule.addAll({
        "day": DateTime.now().add(const Duration(days: 1)).day,
        "month": DateTime.now().add(const Duration(days: 1)).month,
        "year": DateTime.now().add(const Duration(days: 1)).year,
        "turnToRun": "Day",
        "operationType": "Assignation",
        "targetRule": finalRuleId,
        "targetUser": userId
      });
      var dataRule = const JsonEncoder().convert(authDataForRule);

      respRule = await http.post(httpsUriRule, body: dataRule, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
    }

    if (respRule == null || respRule.statusCode == 200) {
      Map<String, dynamic> authData = {
        'userId': '',
        'status': '',
        "manageGeneralCollectorsPermit": '',
        "manageCollectorsPermit": '',
        "manageFootCollectorsPermit": '',
        "manageRulesPermit": '',
        "assingRulePermit": '',
        'personalRule': ''
      };
      authData.addAll({
        'userId': userId,
        'status': status,
        "manageGeneralCollectorsPermit": checkManageGeneralCollectorsPermit,
        "manageCollectorsPermit": checkManageCollectorsPermit,
        "manageFootCollectorsPermit": checkManageFootCollectorsPermit,
        "manageRulesPermit": checkManageRulesPermit,
        "assingRulePermit": checkAssingRulePermit,
        'personalRule': finalRuleId
      });

      var data = const JsonEncoder().convert(authData);

      final resp = await http.patch(httpsUriUserUpdate, body: data, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 200) {
        return {'success': true};
      } else {
        return {"message": resp.reasonPhrase};
      }
    } else {
      return {"message": respRule.reasonPhrase};
    }
  }

  Future<Map<String, dynamic>> addPlayer(
      name, key, password, superiorId, userType) async {
    var httpsUri = Uri(
      scheme: PROTOCOL,
      host: REMOTE_ADDRESS,
      path: 'api/user/register',
    );

    Map<String, dynamic> authData = {
      "name": "",
      "key": "",
      "password": "",
      "superiorId": "",
      "userType": ""
    };
    authData.addAll({
      'name': name,
      'key': key,
      'password': password,
      'superiorId': superiorId,
      'userType': userType
    });
    var data = const JsonEncoder().convert(authData);
    final resp = await http.post(httpsUri, body: data, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    Map<String, dynamic> decodedResp = jsonDecode(resp.body);

    if (resp.statusCode == 403 || resp.statusCode == 500) {
      return {"message": "Autenticar."};
    } else if (resp.statusCode == 200) {
      return {'success': true};
    } else if (resp.statusCode == 400) {
      return decodedResp;
    } else {
      return {"message": resp.reasonPhrase};
    }
  }

  Future<Map<String, dynamic>> lockPlayer(userId) async {
    var httpsUri = Uri(
      scheme: PROTOCOL,
      host: REMOTE_ADDRESS,
      path: 'api/user/block',
    );

    Map<String, dynamic> authData = {"userId": ""};
    authData.addAll({'userId': userId});
    var data = const JsonEncoder().convert(authData);
    final resp = await http.patch(httpsUri, body: data, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    Map<String, dynamic> decodedResp = jsonDecode(resp.body);
    if (resp.statusCode == 403 || resp.statusCode == 500) {
      return {"message": "Autenticar."};
    } else if (resp.statusCode == 200) {
      return {'success': true};
    } else if (resp.statusCode == 400) {
      return decodedResp;
    } else {
      return {"message": resp.reasonPhrase};
    }
  }

  Future<Map<String, dynamic>> unLockPlayer(userId) async {
    var httpsUri = Uri(
      scheme: PROTOCOL,
      host: REMOTE_ADDRESS,
      path: 'api/user/unblock',
    );

    Map<String, dynamic> authData = {"userId": ""};
    authData.addAll({'userId': userId});
    var data = const JsonEncoder().convert(authData);
    final resp = await http.patch(httpsUri, body: data, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    Map<String, dynamic> decodedResp = jsonDecode(resp.body);

    if (resp.statusCode == 403 || resp.statusCode == 500) {
      return {"message": "Autenticar."};
    } else if (resp.statusCode == 200) {
      return {'success': true};
    } else if (resp.statusCode == 400) {
      return decodedResp;
    } else {
      return {"message": resp.reasonPhrase};
    }
  }

  Future<Map<String, dynamic>> deletePlayer(userId) async {
    var httpsUri = Uri(
      scheme: PROTOCOL,
      host: REMOTE_ADDRESS,
      path: 'api/user/',
    );

    Map<String, dynamic> authData = {"userId": ""};
    authData.addAll({'userId': userId});
    var data = const JsonEncoder().convert(authData);
    final resp = await http.delete(httpsUri, body: data, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    Map<String, dynamic> decodedResp = jsonDecode(resp.body);
    if (resp.statusCode == 403 || resp.statusCode == 500) {
      return {"message": "Autenticar."};
    } else if (resp.statusCode == 200) {
      return {'success': true};
    } else if (resp.statusCode == 400) {
      return decodedResp;
    } else {
      return {"message": resp.reasonPhrase};
    }
  }

  Future<Map<String, dynamic>> resetPassword(userId) async {
    var httpsUri = Uri(
      scheme: PROTOCOL,
      host: REMOTE_ADDRESS,
      path: 'api/user/resetPassword',
    );

    Map<String, dynamic> authData = {"userId": ""};
    authData.addAll({'userId': userId});
    var data = const JsonEncoder().convert(authData);
    final resp = await http.patch(httpsUri, body: data, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    Map<String, dynamic> decodedResp = jsonDecode(resp.body);

    if (resp.statusCode == 403) {
      return {"message": resp.reasonPhrase};
    } else if (resp.statusCode == 500) {
      return {"message": "Autenticar."};
    } else if (resp.statusCode == 200) {
      return {'success': true};
    } else if (resp.statusCode == 400) {
      return decodedResp;
    } else {
      return {"message": resp.reasonPhrase};
    }
  }
}
