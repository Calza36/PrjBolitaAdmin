import 'dart:convert';

import 'lista_dto.dart';
import 'shot.dart';

Jugadas jugadasFromJson(String str) => Jugadas.fromJson(json.decode(str));

String jugadasToJson(Jugadas data) => json.encode(data.toJson());

class Jugadas {
  Jugadas({
    this.id,
    this.bruto,
    this.limpio,
    this.premio,
    this.gana,
    this.pierde,
    this.fijoPay,
    this.corridoPay,
    this.parlePay,
    this.centenaPay,
    this.limitFijoPay,
    this.limitCorridoPay,
    this.limitParlePay,
    this.limpioFijoPercent,
    this.limpioCorridoPercent,
    this.limpioParletPercent,
    this.limpioCentenaPercent,
    this.numberLimitDay,
    this.parleLimitDay,
    this.numberLimitNight,
    this.parleLimitNight,
    required this.listOfListDto,
    required this.shot,
  });

  factory Jugadas.fromJson(Map<String, dynamic> json) => Jugadas(
        id: json['id'],
        bruto: json['bruto'].toString(),
        limpio: json['limpio'].toString(),
        premio: json['premio'].toString(),
        gana: json['gana'].toString(),
        pierde: json['pierde'].toString(),
        fijoPay: json['fijoPay'].toString(),
        corridoPay: json['corridoPay'].toString(),
        parlePay: json['parlePay'].toString(),
        centenaPay: json['centenaPay'].toString(),
        limitFijoPay: json['limitFijoPay'].toString(),
        limitCorridoPay: json['limitCorridoPay'].toString(),
        limitParlePay: json['limitParlePay'].toString(),
        numberLimitDay: List<String>.from(json["numberLimitDay"].map((x) => x)),
        parleLimitDay: List<String>.from(json["parleLimitDay"].map((x) => x)),
        numberLimitNight:
            List<String>.from(json["numberLimitNight"].map((x) => x)),
        parleLimitNight:
            List<String>.from(json["parleLimitNight"].map((x) => x)),
        listOfListDto:
            List<ListaDto>.from(json["list"].map((x) => ListaDto.fromJson(x))),
        shot: Shot.fromJson(json['shot']),
      );
  String? id;
  String? bruto;
  String? limpio;
  String? premio;
  String? gana;
  String? pierde;
  String? fijoPay;
  String? corridoPay;
  String? parlePay;
  String? centenaPay;
  String? limitFijoPay;
  String? limitCorridoPay;
  String? limitParlePay;
  String? limpioFijoPercent;
  String? limpioCorridoPercent;
  String? limpioParletPercent;
  String? limpioCentenaPercent;
  List<dynamic>? numberLimitDay;
  List<dynamic>? parleLimitDay;
  List<dynamic>? numberLimitNight;
  List<dynamic>? parleLimitNight;
  List<ListaDto> listOfListDto;
  Shot shot;

  Map<String, dynamic> toList() {
    final map = <String, dynamic>{};
    map['list'] = listOfListDto.map((v) => v.toJson()).toList();
    return map;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['bruto'] = bruto;
    map['limpio'] = limpio;
    map['premio'] = premio;
    map['gana'] = gana;
    map['pierde'] = pierde;
    map['fijoPay'] = fijoPay;
    map['corridoPay'] = corridoPay;
    map['parlePay'] = parlePay;
    map['centenaPay'] = centenaPay;
    map['limitFijoPay'] = limitFijoPay;
    map['limitCorridoPay'] = limitCorridoPay;
    map['limitParlePay'] = limitParlePay;
    map['limpioFijoPercent'] = limpioFijoPercent;
    map['limpioCorridoPercent'] = limpioCorridoPercent;
    map['limpioParletPercent'] = limpioParletPercent;
    map['limpioCentenaPercent'] = limpioCentenaPercent;
    map['numberLimitDay'] = numberLimitDay?.map((v) => v.toJson()).toList();
    map['parleLimitDay'] = parleLimitDay?.map((v) => v.toJson()).toList();
    map['numberLimitNight'] = parleLimitNight?.map((v) => v.toJson()).toList();
    map['list'] = listOfListDto.map((v) => v.toJson()).toList();
    map['shot'] = shot.toJson();
    return map;
  }
}
