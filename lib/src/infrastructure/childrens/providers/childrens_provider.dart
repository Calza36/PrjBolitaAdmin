import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../dtos/index.dart';

class ChildrensProvider {
  String? token = GetItMock.prefs.getString('access_token');

  Future<ChildrensDto> getMyChildrens(userId) async {
    var httpsUri = Uri(
        scheme: PROTOCOL,
        host: REMOTE_ADDRESS,
        path: 'api/user/children',
        queryParameters: {
          "userId": userId,
        }.map((key, value) => MapEntry(key, value.toString())));

    var resp = await http.get(httpsUri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);

    Map<String, dynamic> body = jsonDecode(resp.body);
    var response = ChildrensDto.fromJson(body);
    return response;
  }
}
