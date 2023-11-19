import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../dtos/index.dart';
import '../dtos/payload/node_rule_payload.dart';

class RuleProvider {
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

  Future<RuleElement?> getGeneralRule() async {
    var userFather = GetItMock.prefs.getString('user_id')!;
    var httpsUri =
        Uri(scheme: PROTOCOL, host: REMOTE_ADDRESS, path: 'api/rule/general');

    var resp = await http.get(httpsUri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    var body = jsonDecode(resp.body);
    var response = RuleElement.fromJson(body);
    return response;
  }

  Future<Map<String, dynamic>> editRule(
      NodeRulePayload nodeRulePayload, bool isInUse) async {
    return isInUse
        ? await _callEditRuleAsigned(
            params: {
              "ruleId": nodeRulePayload.id,
              "day": DateTime.now().add(const Duration(days: 1)).day,
              "month": DateTime.now().add(const Duration(days: 1)).month,
              "year": DateTime.now().add(const Duration(days: 1)).year,
              "turnToRun": nodeRulePayload.turnToRun,
              "name": nodeRulePayload.name,
              "fixedPay": nodeRulePayload.fixedPay,
              "runningPay": nodeRulePayload.runningPay,
              "parletPay": nodeRulePayload.parletPay,
              "centPay": nodeRulePayload.centPay,
              "limitFixedPay": nodeRulePayload.limitFixedPay,
              "limitRunningPay": nodeRulePayload.limitRunningPay,
              "limitParletPay": nodeRulePayload.limitParletPay,
              "operationType": "Editing",
              "targetRule": nodeRulePayload.targetRule,
              "maxFixedBet": nodeRulePayload.maxCentBet,
              "maxRunningBet": nodeRulePayload.maxParletBet,
              "maxParletBet": nodeRulePayload.maxParletBet,
              "maxCentBet": nodeRulePayload.maxCentBet,
              "turnsLimits": {
                "day": {
                  "startHour": nodeRulePayload.turnsLimits.day.startHour,
                  "startMinute": nodeRulePayload.turnsLimits.day.startMinute,
                  "endHour": nodeRulePayload.turnsLimits.day.endHour,
                  "endMinute": nodeRulePayload.turnsLimits.day.endMinute
                },
                "night": {
                  "startHour": nodeRulePayload.turnsLimits.night.startHour,
                  "startMinute": nodeRulePayload.turnsLimits.night.startMinute,
                  "endHour": nodeRulePayload.turnsLimits.night.endHour,
                  "endMinute": nodeRulePayload.turnsLimits.night.endMinute
                }
              },
              "footCollectorPaymentPerFixed":
                  nodeRulePayload.footCollectorPaymentPerFixed,
              "footCollectorPaymentPerRunning":
                  nodeRulePayload.footCollectorPaymentPerRunning,
              "footCollectorPaymentPerParlet":
                  nodeRulePayload.footCollectorPaymentPerParlet,
              "footCollectorPaymentPerCent":
                  nodeRulePayload.footCollectorPaymentPerCent,
            },
          )
        : await _callEditRule(
            params: {
              "ruleId": nodeRulePayload.id,
              "day": DateTime.now().add(const Duration(days: 1)).day,
              "month": DateTime.now().add(const Duration(days: 1)).month,
              "year": DateTime.now().add(const Duration(days: 1)).year,
              "turnToRun": nodeRulePayload.turnToRun,
              "name": nodeRulePayload.name,
              "fixedPay": nodeRulePayload.fixedPay,
              "runningPay": nodeRulePayload.runningPay,
              "parletPay": nodeRulePayload.parletPay,
              "centPay": nodeRulePayload.centPay,
              "limitFixedPay": nodeRulePayload.limitFixedPay,
              "limitRunningPay": nodeRulePayload.limitRunningPay,
              "limitParletPay": nodeRulePayload.limitParletPay,
              "operationType": "Editing",
              "targetRule": nodeRulePayload.targetRule,
              "maxFixedBet": nodeRulePayload.maxCentBet,
              "maxRunningBet": nodeRulePayload.maxParletBet,
              "maxParletBet": nodeRulePayload.maxParletBet,
              "maxCentBet": nodeRulePayload.maxCentBet,
              "turnsLimits": {
                "day": {
                  "startHour": nodeRulePayload.turnsLimits.day.startHour,
                  "startMinute": nodeRulePayload.turnsLimits.day.startMinute,
                  "endHour": nodeRulePayload.turnsLimits.day.endHour,
                  "endMinute": nodeRulePayload.turnsLimits.day.endMinute
                },
                "night": {
                  "startHour": nodeRulePayload.turnsLimits.night.startHour,
                  "startMinute": nodeRulePayload.turnsLimits.night.startMinute,
                  "endHour": nodeRulePayload.turnsLimits.night.endHour,
                  "endMinute": nodeRulePayload.turnsLimits.night.endMinute
                }
              },
              "footCollectorPaymentPerFixed":
                  nodeRulePayload.footCollectorPaymentPerFixed,
              "footCollectorPaymentPerRunning":
                  nodeRulePayload.footCollectorPaymentPerRunning,
              "footCollectorPaymentPerParlet":
                  nodeRulePayload.footCollectorPaymentPerParlet,
              "footCollectorPaymentPerCent":
                  nodeRulePayload.footCollectorPaymentPerCent,
            },
          );
  }

  Future<Map<String, dynamic>> _callEditRule({
    required Map<String, dynamic> params,
  }) async {
    try {
      var httpsUri = Uri(
        scheme: PROTOCOL,
        host: REMOTE_ADDRESS,
        path: 'api/rule/edit',
      );
      var resp = await http
          .patch(httpsUri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(params))
          .timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403 ||
          resp.statusCode == 404 ||
          resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(resp.body);
        return {"success": body};
      } else {
        if (resp.statusCode == 400) {
          Map<String, dynamic> body = jsonDecode(resp.body);
          return {"message": "Algo salió mal.\n"};
        } else {
          return {"message": "Algo salió mal."};
        }
      }
    } catch (e) {
      return {"message": "Algo salió mal. Verifique el acceso al servidor."};
    }
  }

  Future<Map<String, dynamic>> _callEditRuleAsigned({
    required Map<String, dynamic> params,
  }) async {
    try {
      var httpsUri = Uri(
        scheme: PROTOCOL,
        host: REMOTE_ADDRESS,
        path: 'api/rulingQueue/',
      );
      var resp = await http
          .post(httpsUri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(params))
          .timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403 ||
          resp.statusCode == 404 ||
          resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(resp.body);
        return {"success": body};
      } else {
        if (resp.statusCode == 400) {
          Map<String, dynamic> body = jsonDecode(resp.body);
          return {"message": "Algo salió mal.\n"};
        } else {
          return {"message": "Algo salió mal."};
        }
      }
    } catch (e) {
      return {"message": "Algo salió mal. Verifique el acceso al servidor."};
    }
  }

  Future<Map<String, dynamic>> addRule(NodeRulePayload nodeRulePayload) async {
    return await _callAddRule(
      params: {
        "day": nodeRulePayload.day,
        "month": nodeRulePayload.month,
        "year": nodeRulePayload.year,
        "turnToRun": nodeRulePayload.turnToRun,
        "name": nodeRulePayload.name,
        "fixedPay": nodeRulePayload.fixedPay,
        "runningPay": nodeRulePayload.runningPay,
        "parletPay": nodeRulePayload.parletPay,
        "centPay": nodeRulePayload.centPay,
        "limitFixedPay": nodeRulePayload.limitFixedPay,
        "limitRunningPay": nodeRulePayload.limitRunningPay,
        "limitParletPay": nodeRulePayload.limitParletPay,
        "maxFixedBet": nodeRulePayload.maxCentBet,
        "maxRunningBet": nodeRulePayload.maxParletBet,
        "maxParletBet": nodeRulePayload.maxParletBet,
        "maxCentBet": nodeRulePayload.maxCentBet,
        "turnsLimits": {
          "day": {
            "startHour": nodeRulePayload.turnsLimits.day.startHour,
            "startMinute": nodeRulePayload.turnsLimits.day.startMinute,
            "endHour": nodeRulePayload.turnsLimits.day.endHour,
            "endMinute": nodeRulePayload.turnsLimits.day.endMinute
          },
          "night": {
            "startHour": nodeRulePayload.turnsLimits.night.startHour,
            "startMinute": nodeRulePayload.turnsLimits.night.startMinute,
            "endHour": nodeRulePayload.turnsLimits.night.endHour,
            "endMinute": nodeRulePayload.turnsLimits.night.endMinute
          }
        },
        "footCollectorPaymentPerFixed":
            nodeRulePayload.footCollectorPaymentPerFixed,
        "footCollectorPaymentPerRunning":
            nodeRulePayload.footCollectorPaymentPerRunning,
        "footCollectorPaymentPerParlet":
            nodeRulePayload.footCollectorPaymentPerParlet,
        "footCollectorPaymentPerCent":
            nodeRulePayload.footCollectorPaymentPerCent,
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
