import 'dart:convert';

ResumenModel resumenFromJson(String str) =>
    ResumenModel.fromJson(json.decode(str));

String resumenToJson(ResumenModel data) => json.encode(data.toJson());

class ResumenModel {
  double bruto;
  double limpio;
  double gana;
  double premio;
  double pierde;

  ResumenModel({
    this.bruto = 0,
    this.limpio = 0,
    this.gana = 0,
    this.premio = 0,
    this.pierde = 0,
  });

  // ResumenModel(this.bruto, this.limpio, this.gana, this.premio, this.pierde);

  factory ResumenModel.fromJson(Map<String, dynamic> json) => ResumenModel(
        bruto: json["bruto"],
        limpio: json["limpio"],
        gana: json["gana"],
        premio: json["premio"],
        pierde: json["pierde"],
      );

  Map<String, dynamic> toJson() => {
        "bruto": bruto,
        "limpio": limpio,
        "gana": gana,
        "premio": premio,
        "pierde": pierde,
      };
}