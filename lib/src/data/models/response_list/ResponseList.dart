import '../jugadas_model.dart';

class ResponseList {
  ResponseList({
    required this.id,
    required this.bruto,
    required this.limpio,
    required this.premio,
    required this.gana,
    required this.pierde,
    required this.fijoPay,
    required this.corridoPay,
    required this.parlePay,
    required this.centenaPay,
    required this.limitFijoPay,
    required this.limitCorridoPay,
    required this.limitParlePay,
    required this.limitCentenaPay,
    required this.fijoLimit,
    required this.corridoLimit,
    required this.parleLimit,
    required this.centenaLimit,
    required this.lista,
  });

  String id;
  int bruto;
  int limpio;
  int premio;
  int gana;
  int pierde;
  int fijoPay;
  int corridoPay;
  int parlePay;
  int centenaPay;
  int limitFijoPay;
  int limitCorridoPay;
  int limitParlePay;
  int limitCentenaPay;
  List<dynamic> fijoLimit;
  List<dynamic> corridoLimit;
  List<dynamic> parleLimit;
  List<dynamic> centenaLimit;
  List<JugadasModel> lista;
}
