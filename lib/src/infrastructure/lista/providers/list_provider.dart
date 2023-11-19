import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../dtos/jugadas.dart';

class ListProvider {
  String? token = GetItMock.prefs.getString('access_token');

  Future obtenerLista(userId, turn, day, month, year) async {
    var httpsUri = Uri(
        scheme: PROTOCOL,
        host: REMOTE_ADDRESS,
        path: '/api/list/',
        queryParameters: {
          "userId": userId,
          "turn": turn,
          "day": day,
          "month": month,
          "year": year
        }.map((key, value) => MapEntry(key, value.toString())));

    var resp = await http.get(httpsUri, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    }).timeout(TIMEOUT_API_CALL);
    Map<String, dynamic> body = jsonDecode(resp.body);
    var response = Jugadas.fromJson(body);
    return response;
  }
}
