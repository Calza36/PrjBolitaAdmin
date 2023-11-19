import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../aplication/env/env.dart';
import '../../infrastructure/ruler/index.dart';
import '../../infrastructure/user/dtos/login_success.dart';
import '../services/get_it_mock.dart';

class UserProvider {
  Future login(String username, String password) async {
    var httpsUri = Uri(
      scheme: PROTOCOL,
      host: 'lotery-musashi98.vercel.app',
      path: 'api/user/login',
    );
    Map<String, dynamic> authData = {
      'name': '',
      'password': '',
      'isFootCollector': ''
    };
    authData.addAll(
        {'name': username, 'password': password, 'isFootCollector': false});
    var data = const JsonEncoder().convert(authData);
    await GetItMock.configurePrefs();
    final resp = await http.post(httpsUri,
        body: data, headers: {"Content-Type": "application/json"});

    if (resp.statusCode == 403) {
      return {"message": "Autenticar."};
    } else if (resp.statusCode == 500 || resp.statusCode == 504) {
      return {"message": "Error del servidor."};
    } else if (resp.statusCode == 200) {
      Map<String, dynamic> decodedResp = jsonDecode(resp.body);
      final loginSuccess = LoginSuccess.fromJson(jsonDecode(resp.body));
      //Salvar el token en el store
      GetItMock.prefs.setString('access_token', decodedResp['accessToken']);
      GetItMock.prefs.setString('refresh_token', decodedResp['refreshToken']);
      GetItMock.prefs.setBool('authenticated', true);
      GetItMock.prefs.setInt("serverTime_hour", loginSuccess.serverTime!.hour!);
      GetItMock.prefs
          .setInt("serverTime_minute", loginSuccess.serverTime!.minute!);
      GetItMock.prefs.setString("user_id", loginSuccess.user!.id!);
      GetItMock.prefs.setString("user_id", loginSuccess.user!.id!);
      GetItMock.prefs.setString("user_name", loginSuccess.user!.name!);
      GetItMock.prefs.setString("user_type", loginSuccess.user!.userType!);

      GetItMock.prefs.setBool("manageFootCollectorsPermit",
          loginSuccess.user!.manageFootCollectorsPermit!);
      GetItMock.prefs.setBool(
          "manageCollectorsPermit", loginSuccess.user!.manageCollectorsPermit!);
      GetItMock.prefs.setBool("manageGeneralCollectorsPermit",
          loginSuccess.user!.manageGeneralCollectorsPermit!);
      GetItMock.prefs
          .setBool("assingRulePermit", loginSuccess.user!.assingRulePermit!);
      GetItMock.prefs
          .setBool("manageRulesPermit", loginSuccess.user!.manageRulesPermit!);

      GetItMock.prefs.setString("session", 'on');
      //permisos

      /// User Data
      RuleElement? generalRule = await RuleProvider().getGeneralRule();
      if (generalRule != null) {
        String grRawJson = jsonEncode(generalRule.toJson());
        GetItMock.prefs.setString("generalRule", grRawJson);
        //ToRecover
        // final rawJson = GetItMock.prefs.getString("generalRule")!;
        // Map<String, dynamic> map = jsonDecode(rawJson);
        // RuleElement gRuleObj = RuleElement.fromJson(map);
        //print(gRuleObj);
      } else {
        return {'error': true};
      }

      Map<String, dynamic> privateRules =
          await RuleProvider().getPrivateRules();
      if (privateRules['success'] != null) {
        String rsRawJson = jsonEncode(privateRules['success'].toJson());
        GetItMock.prefs.setString("privateRules", rsRawJson);
      } else {
        return {'error': true};
      }
      GetItMock.loadRules();
      return {'ok': true, 'access_token': decodedResp['accessToken']};
    } else if (resp.statusCode != 200) {
      return {"ok": false};
    } else {
      return {"error": true};
    }
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    String token = GetItMock.prefs.getString("access_token")!;
    var httpsUri = Uri(
      scheme: PROTOCOL,
      host: 'lotery-musashi98.vercel.app',
      path: 'api/user/changePassword',
    );
    Map<String, String> data = {'prevPassword ': '', 'newPassword ': ''};
    data.addAll({'prevPassword': oldPassword, 'newPassword': newPassword});
    var dat = const JsonEncoder().convert(data);
    final resp = await http.patch(httpsUri, body: dat, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
