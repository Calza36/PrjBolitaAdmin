import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/src/infrastructure/shoot/providers/payload/shoot_payload.dart';

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../dtos/limited.dart';

class ShootProvider {
  String? token = GetItMock.prefs.getString('access_token');
  var httpsUri = Uri(
    scheme: PROTOCOL,
    host: REMOTE_ADDRESS,
    path: 'api/shot/',
  );
  var httpsUriLimited = Uri(
    scheme: PROTOCOL,
    host: REMOTE_ADDRESS,
    path: 'api/limited',
  );

  Future<Map<String, dynamic>> getLimitationQueue() async {
    try {
      var resp = await http.get(httpsUri, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
      List<dynamic> body = jsonDecode(resp.body);
      if (resp.statusCode == 403 || resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        return {"success": true};
      }
      return body as Map<String, dynamic>;
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<bool?> deleteLimitationQueueById(String programmingId) async {
    return await _callDeleteProductByPk(
      params: {
        'programmingId': programmingId,
      },
    );
  }

  Future<bool> _callDeleteProductByPk({
    required Map<String, dynamic> params,
  }) async {
    var resp = await http
        .delete(httpsUri,
            headers: {
              "Accept": "application/json",
              "Authorization": "Bearer $token"
            },
            body: jsonEncode(params))
        .timeout(TIMEOUT_API_CALL);
    Map<String, dynamic> body = jsonDecode(resp.body);

    if (body['message'] == null) {
      throw Exception('Error');
    }
    return body['message'] == 'Programmed limitation deleted';
  }

  Future<Map<String, dynamic>> getCurrentLimits() async {
    try {
      var resp = await http.get(httpsUriLimited, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
      Map<String, dynamic> body = jsonDecode(resp.body);
      if (resp.statusCode == 403 || resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        var response = Limited.fromJson(body);
        return {"success": response};
      }
      return body;
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> addShoot(ShootPayload shootPayload) async {
    return await _callAddShoot(
      params: {
        "day": shootPayload.day,
        "month": shootPayload.month,
        "year": shootPayload.year,
        "turn": shootPayload.turn,
        "number": shootPayload.number,
      },
    );
  }

  Future<Map<String, dynamic>> _callAddShoot({
    required Map<String, dynamic> params,
  }) async {
    try {
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
        if (body["message"] == "Shot saved ... updating prizes") {
          return {"success": true};
        }
        return {"success": body};
      } else {
        if (resp.statusCode == 400) {
          return {
            "message": "Algo salió mal.\nVerifique si ya existe tiro "
                "en el turno objetivo."
          };
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
