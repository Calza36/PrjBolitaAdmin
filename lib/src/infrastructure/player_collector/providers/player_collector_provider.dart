import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../dtos/index.dart';

class PlayerCollectorProvider {
  String? token = GetItMock.prefs.getString('access_token');

  Future<Map<String, dynamic>> getPlayerCollector() async {
    try {
      var userFather = GetItMock.prefs.getString('user_id')!;
      var httpsUri = Uri(
          scheme: PROTOCOL,
          host: REMOTE_ADDRESS,
          path: 'api/user/collectors',
          queryParameters: {
            "userId": userFather,
          }.map((key, value) => MapEntry(key, value.toString())));

      var resp = await http.get(httpsUri, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403 || resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        List<dynamic> body = jsonDecode(resp.body);
        var response = PlayerCollector.fromJson(
            {"collectors": body}.map((key, value) => MapEntry(key, value)));

        return {'success': response};
      } else {
        return jsonDecode(resp.body);
      }
    } catch (e) {
      return {'message': e.toString()};
    }
  }
}
