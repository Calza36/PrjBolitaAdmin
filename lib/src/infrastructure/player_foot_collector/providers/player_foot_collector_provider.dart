import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../dtos/index.dart';

class PlayerFootCollectorProvider {
  String? token = GetItMock.prefs.getString('access_token');

  Future<Map<String, dynamic>> getPlayerFootCollector() async {
    try {
      var userFather = GetItMock.prefs.getString('user_id')!;
      print("--------------------------------------  "
          "PlayerFootCollector--------------------------------------"
          "\ngetPlayerFootCollector on Provider: userFather: $userFather  ");
      var httpsUri = Uri(
          scheme: PROTOCOL,
          host: REMOTE_ADDRESS,
          path: 'api/user/footCollectors',
          queryParameters: {
            "userId": userFather,
          }.map((key, value) => MapEntry(key, value.toString())));

      var resp = await http.get(httpsUri, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);

      print(resp.statusCode);
      // print(resp.body);

      if (resp.statusCode == 403 || resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        // print(resp.body);
        List<dynamic> body = jsonDecode(resp.body);
        print(body);
        var response = PlayerFootCollector.fromJson(
            {"footCollectors": body}.map((key, value) => MapEntry(key, value)));

        print("Lista footCollectors: ${response}");
        return {"success": response};
      } else {
        return jsonDecode(resp.body) as Map<String, dynamic>;
      }
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map> deletePlayer(String userId) async {
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    print(headers);

    var httpsUri = Uri(
      scheme: PROTOCOL,
      host: REMOTE_ADDRESS,
      path: 'api/user/',
    );

    Map<String, dynamic> deleteDataBody = {'userId': ''};

    deleteDataBody.addAll({'userId': userId});

    var jsonDataBody = const JsonEncoder().convert(deleteDataBody);

    final resp = await http.delete(httpsUri, body: jsonDataBody, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    Map<String, dynamic> decodedResp = jsonDecode(resp.body);

    print(resp.statusCode);
    print("DecodeResp: $decodedResp");
    if (resp.statusCode == 403 || resp.statusCode == 500) {
      return {"message": "Autenticar."};
    } else if (resp.statusCode == 200) {
      return {
        'ok': true,
      };
    } else if (resp.statusCode != 200) {
      return {"ok": false, "message": resp.reasonPhrase};
    } else {
      return {"error": true};
    }
  }
}
