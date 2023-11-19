import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../infrastructure/ruler/dtos/index.dart';
import '../../infrastructure/user/dtos/login_success.dart';

class GetItMock {
  static late SharedPreferences prefs;
  static late User user;
  static late RuleElement generalRule;
  static late Rule privateRules;
  static late LoginSuccess server;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> loadRules() async {
    final rawJson = GetItMock.prefs.getString("privateRules")!;
    Map<String, dynamic> map = jsonDecode(rawJson);
    privateRules = Rule.fromJson(map);
    final rawJson2 = GetItMock.prefs.getString("generalRule")!;
    Map<String, dynamic> map2 = jsonDecode(rawJson2);
    generalRule = RuleElement.fromJson(map2);
  }

  static RuleElement getMyRule(String idPlayer) {
    final rawJson = prefs.getString("privateRules")!;
    Map<String, dynamic> map = jsonDecode(rawJson);
    privateRules = Rule.fromJson(map);

    final rawJson2 = prefs.getString("generalRule")!;
    Map<String, dynamic> map2 = jsonDecode(rawJson2);
    generalRule = RuleElement.fromJson(map2);

    var myRule = privateRules.rules!.firstWhere(
        (element) => element.footCollectors!.contains(idPlayer),
        orElse: () => GetItMock.generalRule);
    return myRule;
  }

  static bool manageFootCollectorsPermit() {
    return prefs.getBool("manageFootCollectorsPermit")!;
  }

  static bool manageCollectorsPermit() {
    return prefs.getBool("manageCollectorsPermit")!;
  }

  static bool manageGeneralCollectorsPermit() {
    return prefs.getBool("manageGeneralCollectorsPermit")!;
  }

  static String typeOfUser() {
    return prefs.getString("user_type")!;
  }

  static bool assingRulePermit() {
    return prefs.getBool("assingRulePermit")!;
  }

  static bool manageRulesPermit() {
    return prefs.getBool("manageRulesPermit")!;
  }
}
