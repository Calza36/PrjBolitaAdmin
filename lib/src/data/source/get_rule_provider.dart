import 'package:http/http.dart' as http;

import '../services/get_it_mock.dart';

class RulesProvider {
  String? token = GetItMock.prefs.getString('access_token');

  // Future rules() async {
  //   var httpsUri = Uri(
  //     scheme: 'https',
  //     host: 'srv224118-206152.vps.etecsa.cu',
  //     path: 'structure/get_current_rules',
  //     queryParameters: {"session": "day"},
  //   );
  //
  //   var resp = await http.get(
  //     httpsUri,
  //     headers: {
  //       "Accept": "application/json",
  //       "Authorization": "Bearer $token"
  //     },
  //   );
  //
  //   var body = jsonDecode(resp.body);
  //
  //   print("Status: ${resp.statusCode}");
  //   // if(resp.statusCode == 401){
  //   //   LocalStorage.prefs.remove("access_token");
  //   //   LocalStorage.prefs.remove("refresh_token");
  //   //   LocalStorage.prefs.remove("key");
  //   //   LocalStorage.prefs.remove("centena_limited_pay");
  //   //   LocalStorage.prefs.remove("corrido_limited_pay");
  //   //   LocalStorage.prefs.remove("parle_limited_pay");
  //   //   LocalStorage.prefs.remove("fijo_limited_pay");
  //   //   LocalStorage.prefs.remove("centena_pay");
  //   //   LocalStorage.prefs.remove("corrido_pay");
  //   //   LocalStorage.prefs.remove("parle_pay");
  //   //   LocalStorage.prefs.remove("fijo_pay");
  //   //   LocalStorage.prefs.remove("pin");
  //   //   LocalStorage.prefs.remove("authenticated");
  //   // }else{
  //   //   LocalStorage.prefs.setString("key", body['lista']['key'].toString());
  //   //   LocalStorage.prefs.setDouble("centena_limited_pay", body['centena_limited_pay']);
  //   //   LocalStorage.prefs.setDouble("corrido_limited_pay", body['corrido_limited_pay']);
  //   //   LocalStorage.prefs.setDouble("parle_limited_pay", body['parle_limited_pay']);
  //   //   LocalStorage.prefs.setDouble("fijo_limited_pay", body['fijo_limited_pay']);
  //   //   LocalStorage.prefs.setDouble("centena_pay", body['centena_pay']);
  //   //   LocalStorage.prefs.setDouble("corrido_pay", body['corrido_pay']);
  //   //   LocalStorage.prefs.setDouble("parle_pay", body['parle_pay']);
  //   //   LocalStorage.prefs.setDouble("fijo_pay", body['fijo_pay']);
  //   }
  //   return body;
  // }

  Future rulesSesion() async {
    var httpsUriRulesSesion = Uri(
      scheme: 'http',
      host: 'srv224118-206152.vps.etecsa.cu',
      path: 'structure/get_session_rules',
      queryParameters: {"session": "day"},
    );

    var resp = await http.get(
      httpsUriRulesSesion,
      //headers: {"Bearer": token},
      headers: {
        // "": $,
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
    );
  }

  Future listOpen() async {
    var httpsUriRulesSesion = Uri(
      scheme: 'https',
      host: 'srv224118-206152.vps.etecsa.cu',
      path: 'structure/open_lista',
    );

    var resp = await http.get(
      httpsUriRulesSesion,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
  }

  Future listClose() async {
    var httpsUriRulesSesion = Uri(
      scheme: 'https',
      host: 'srv224118-206152.vps.etecsa.cu',
      path: 'structure/close_lista',
    );

    var resp = await http.get(
      httpsUriRulesSesion,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
  }
}
