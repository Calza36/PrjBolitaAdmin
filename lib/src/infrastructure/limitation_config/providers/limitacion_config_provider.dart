import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/src/domain/limitation_queue/entity/limits_entity.dart';
import 'package:untitled/src/infrastructure/limitation_config/dtos/specific.dart';

import '../../../aplication/env/env.dart';
import '../../../data/services/get_it_mock.dart';
import '../../../domain/limitation_queue/entity/limitation_request.dart';
import '../dtos/current_limited.dart';
import '../dtos/limitated.dart';
import '../dtos/next_limited.dart';

class LimitationConfigProvider {
  String? token = GetItMock.prefs.getString('access_token');
  var httpsUri = Uri(
    scheme: PROTOCOL,
    host: REMOTE_ADDRESS,
    path: 'api/limited/',
  );
  var httpsUriLimited = Uri(
    scheme: PROTOCOL,
    host: REMOTE_ADDRESS,
    path: 'api/limited/current',
  );

  Future<Map<String, dynamic>> getLimitateds() async {
    try {
      var resp = await http.get(httpsUri, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403) {
        return {"message": "Autenticar."};
      }
      if (resp.statusCode == 200) {
        final List<Limitated> limitatedList = limitatedFromJson(resp.body);
        return {"success": limitatedList};
      }
      return jsonDecode(resp.body);
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> deleteLimitationById(String limitedId) async {
    return await _callDeleteProductByPk(
      params: {
        'limitedId': limitedId,
      },
    );
  }

  Future<Map<String, dynamic>> _callDeleteProductByPk({
    required Map<String, dynamic> params,
  }) async {
    try {
      var resp = await http
          .delete(httpsUri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(params))
          .timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(resp.body);
        return {"success": body};
      } else {
        if (resp.statusCode == 400) {
          return {"message": "Algo salió mal."};
        } else {
          return {"message": "Algo salió mal."};
        }
      }
    } catch (e) {
      return {"message": "Algo salió mal. Verifique el acceso al servidor."};
    }
  }

  Future<Map<String, dynamic>> getCurrentLimits() async {
    try {
      var resp = await http.get(httpsUriLimited, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
      Map<String, dynamic> body = jsonDecode(resp.body);
      var response = CurrentLimited.fromJson(body);
      //Map<String, dynamic> body = jsonDecode(resp.body);
      if (resp.statusCode == 403 || resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        print(body);
        print("Limited: $response");
        return {"success": response};
      }
      return body;
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> addLimitationQueue(
      LimitationRequestEntity limitationRequestEntity) async {
    return await _callAddLimitation(
      params: {
        "day": limitationRequestEntity.day,
        "month": limitationRequestEntity.month,
        "year": limitationRequestEntity.year,
        "turn": limitationRequestEntity.turn,
        "numbers": limitationRequestEntity.turn == "Day"
            ? limitationRequestEntity.numberDay
            : limitationRequestEntity.numberNight,
        "parlets": limitationRequestEntity.turn == "Day"
            ? limitationRequestEntity.parletDay
            : limitationRequestEntity.parletNight
      },
    );
  }

  Future<Map<String, dynamic>> _callAddLimitation({
    required Map<String, dynamic> params,
  }) async {
    try {
      print(params);
      var resp = await http
          .post(httpsUri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(params))
          .timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(resp.body);
        return {"success": body};
      } else {
        if (resp.statusCode == 400) {
          return {
            "message": "Algo salió mal.\nVerifique si ya existen límites "
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

  Future<Map<String, dynamic>> editLimitationQueue(
      LimitsEntity newCurrentLimitedEntity) async {
    return await _callEditLimitation(
      params: {
        "numbers": newCurrentLimitedEntity.numbers,
        "parlets": newCurrentLimitedEntity.parlets
      },
    );
  }

  Future<Map<String, dynamic>> _callEditLimitation({
    required Map<String, dynamic> params,
  }) async {
    try {
      if (kDebugMode) {
        print(params);
      }
      var resp = await http
          .patch(httpsUri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(params))
          .timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(resp.body);
        return {"success": body};
      } else {
        if (resp.statusCode == 400) {
          return {
            "message": "Algo salió mal.\nVerifique si ya existen límites "
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

  Future<Map<String, dynamic>> getLimitationByTurn(
      day, month, year, turn) async {
    try {
      var uri = Uri(
          scheme: PROTOCOL,
          host: REMOTE_ADDRESS,
          path: 'api/limited/specific',
          queryParameters: {
            "turn": turn,
            "day": day,
            "month": month,
            "year": year
          }.map((key, value) => MapEntry(key, value.toString())));

      var resp = await http.get(uri, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
      Map<String, dynamic> body = jsonDecode(resp.body);
      if (resp.statusCode == 403 || resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        print(body);
        var response = Specific.fromJson(body);
        print("Limited: $response");
        return {"success": response};
      }
      return body;
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  /*** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***/

  Future<Map<String, dynamic>> updateNextNightLimited(
      LimitsEntity newCurrentLimitedEntity) async {
    return await _callPatchNextNightLimited(
      /*
      *
{
    "numbers": [ "01", "06", "11", "09" ],
    "parlets": [ "03,05", "11,23", "23,56" ]
}
* */
      params: {
        "numbers": newCurrentLimitedEntity.numbers,
        "parlets": newCurrentLimitedEntity.parlets
      },
    );
  }

  Future<Map<String, dynamic>> _callPatchNextNightLimited({
    required Map<String, dynamic> params,
  }) async {
    try {
      var nextNightLimitedUri = Uri(
        scheme: PROTOCOL,
        host: REMOTE_ADDRESS,
        path: 'api/appConfigParams/nextNightLimited',
      );
      if (kDebugMode) {
        print(params);
      }
      var resp = await http
          .patch(nextNightLimitedUri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(params))
          .timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(resp.body);
        return {"success": body};
      } else {
        if (resp.statusCode == 400) {
          return {
            "message": "Algo salió mal.\nVerifique si ya existen límites "
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

  Future<Map<String, dynamic>> updateNextDayLimited(
      LimitsEntity newCurrentLimitedEntity) async {
    return await _callNextDayLimited(
      params: {
        "numbers": newCurrentLimitedEntity.numbers,
        "parlets": newCurrentLimitedEntity.parlets
      },
    );
  }

  Future<Map<String, dynamic>> _callNextDayLimited({
    required Map<String, dynamic> params,
  }) async {
    try {
      var nextDayLimitedUri = Uri(
        scheme: PROTOCOL,
        host: REMOTE_ADDRESS,
        path: 'api/appConfigParams/nextDayLimited',
      );
      if (kDebugMode) {
        print(params);
      }
      var resp = await http
          .patch(nextDayLimitedUri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(params))
          .timeout(TIMEOUT_API_CALL);
      if (resp.statusCode == 403) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(resp.body);
        return {"success": body};
      } else {
        return {"message": "Algo salió mal."};
      }
    } catch (e) {
      return {"message": "Algo salió mal. Verifique el acceso al servidor."};
    }
    //print('DeleteProductByPk -> ' + result.operation! + ' ' + result// .message!);
  }

  Future<Map<String, dynamic>> getCurrentLimited() async {
    try {
      var uri = Uri(
          scheme: PROTOCOL,
          host: REMOTE_ADDRESS,
          path: 'api/appConfigParams/currentLimited');

      var resp = await http.get(uri, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
      Map<String, dynamic> body = jsonDecode(resp.body);
      if (resp.statusCode == 403 || resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        print(body);
        var response = CurrentLimited.fromJson(body);
        print("Limited: $response");
        return {"success": response};
      }
      return body;
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }


  Future<Map<String, dynamic>> getNextLimited() async {
    try {
      var uri = Uri(
          scheme: PROTOCOL,
          host: REMOTE_ADDRESS,
          path: 'api/appConfigParams/nextLimited');

      var resp = await http.get(uri, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(TIMEOUT_API_CALL);
      Map<String, dynamic> body = jsonDecode(resp.body);
      if (resp.statusCode == 403 || resp.statusCode == 500) {
        return {"message": "Autenticar."};
      } else if (resp.statusCode == 200) {
        print(body);
        var response = NextLimited.fromJson(body);
        print("Limited: $response");
        return {"success": response};
      }
      return body;
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

}
