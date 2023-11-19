import 'dart:convert';

Rules rulesFromJson(String str) => Rules.fromJson(json.decode(str));

String rulesToJson(Rules data) => json.encode(data.toJson());

class Rules {
  Rules({
    required this.lista,
    required this.session,
    required this.centenaPay,
    required this.corridoPay,
    required this.parlePay,
    required this.fijoPay,
    required this.centenaLimit,
    required this.corridoLimit,
    required this.parleLimit,
    required this.fijoLimit,
    required this.result,
    required this.prize,
    required this.close,
    required this.open,
    required this.end,
  });

  final Lista? lista;
  final String? session;
  final int? centenaPay;
  final int? corridoPay;
  final int? parlePay;
  final int? fijoPay;
  final int? centenaLimit;
  final int? corridoLimit;
  final int? parleLimit;
  final int? fijoLimit;
  final String? result;
  final String? prize;
  final String? close;
  final String? open;
  final String? end;

  factory Rules.fromJson(Map<String, dynamic> json) {
    return Rules(
      lista: json["lista"] == null ? null : Lista.fromJson(json["lista"]),
      session: json["session"],
      centenaPay: json["centena_pay"],
      corridoPay: json["corrido_pay"],
      parlePay: json["parle_pay"],
      fijoPay: json["fijo_pay"],
      centenaLimit: json["centena_limit"],
      corridoLimit: json["corrido_limit"],
      parleLimit: json["parle_limit"],
      fijoLimit: json["fijo_limit"],
      result: json["result"],
      prize: json["prize"],
      close: json["close"],
      open: json["open"],
      end: json["end"],
    );
  }

  Map<String, dynamic> toJson() => {
        "lista": lista?.toJson(),
        "session": session,
        "centena_pay": centenaPay,
        "corrido_pay": corridoPay,
        "parle_pay": parlePay,
        "fijo_pay": fijoPay,
        "centena_limit": centenaLimit,
        "corrido_limit": corridoLimit,
        "parle_limit": parleLimit,
        "fijo_limit": fijoLimit,
        "result": result,
        "prize": prize,
        "close": close,
        "open": open,
        "end": end,
      };

  @override
  String toString() {
    return '$lista, $session, $centenaPay, $corridoPay, $parlePay, $fijoPay, $centenaLimit, $corridoLimit, $parleLimit, $fijoLimit, $result, $prize, $close, $open, $end';
  }
}

class Lista {
  Lista({
    required this.key,
  });

  final String? key;

  factory Lista.fromJson(Map<String, dynamic> json) {
    return Lista(
      key: json["key"],
    );
  }

  Map<String, dynamic> toJson() => {
        "key": key,
      };

  @override
  String toString() {
    return '$key';
  }
}
