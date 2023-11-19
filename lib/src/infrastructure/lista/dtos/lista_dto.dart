import 'dart:convert';

ListaDto listaDtoFromJson(String str) => ListaDto.fromJson(json.decode(str));

String listaDtoToJson(ListaDto data) => json.encode(data.toJson());

class ListaDto {
  ListaDto({
    this.id,
    required this.number,
    this.fijo,
    this.corrido,
    this.bet,
    this.prize,
    required this.elementType,
    this.numbers,
  });

  factory ListaDto.fromJson(dynamic json) => ListaDto(
        id: json['id'],
        number: json['number'],
        fijo: json['fixBet'].toString(),
        corrido: json['runBet'].toString(),
        elementType: json['elementType'],
        bet: json['bet'].toString(),
        prize: json['prize'].toString(),
        numbers: List<String>.from(json["numbers"].map((x) => x)),
      );

  String? id;
  String number;
  String? fijo;
  String? corrido;
  String? prize;
  String elementType;
  String? bet;
  List<String>? numbers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fijo'] = fijo;
    map['corrido'] = corrido;
    map['number'] = number;
    map['elementType'] = elementType;
    map['bet'] = bet;
    map['prize'] = prize;
    map['numbers'] = numbers?.map((v) => v).toList();
    return map;
  }
}
