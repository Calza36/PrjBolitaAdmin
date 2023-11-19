// To parse this JSON data, do
//
//     final fijoCorrido = fijoCorridoFromJson(jsonString);

import 'dart:convert';

FijoCorrido fijoCorridoFromJson(String str) =>
    FijoCorrido.fromJson(json.decode(str));

String fijoCorridoToJson(FijoCorrido data) => json.encode(data.toJson());

class FijoCorrido {
  int limpio;
  int timestamp;
  List<int> idemPk = [];
  String bet;
  List<int> number;
  List<int> corrido;
  List<int> fijo;

  FijoCorrido({
    this.limpio = 0,
    this.timestamp = 0,
    required this.idemPk,
    this.bet = "",
    required this.number,
    required this.corrido,
    required this.fijo,
  });

  factory FijoCorrido.fromJson(Map<String, dynamic> json) => FijoCorrido(
        limpio: json["limpio"],
        timestamp: json["timestamp"],
        idemPk: List<int>.from(json["idem_pk"].map((x) => x)),
        bet: json["bet"],
        number: List<int>.from(json["number"].map((x) => x)),
        corrido: List<int>.from(json["corrido"].map((x) => x)),
        fijo: List<int>.from(json["fijo"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "limpio": limpio,
        "timestamp": timestamp,
        "idem_pk": List<dynamic>.from(idemPk.map((x) => x)),
        "bet": bet,
        "number": List<dynamic>.from(number.map((x) => x)),
        "corrido": List<dynamic>.from(corrido.map((x) => x)),
        "fijo": List<dynamic>.from(fijo.map((x) => x)),
      };
}
