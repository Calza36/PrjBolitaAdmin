class JugadasModel {
  int idem_pk = 10000;
  int number = 0;
  double fijo = 0.0;
  double corrido = 0.0;
  String type = "";
  double bet = 0.0;
  String numbers = "";

  JugadasModel(this.idem_pk, this.number, this.fijo, this.corrido, this.type,
      this.bet, this.numbers);

  Map<String, dynamic> toMap() {
    return {
      'idem_pk': idem_pk,
      'number': number,
      'fijo': fijo,
      'corrido': corrido,
      'type': type,
      'bet': bet,
      'numbers': numbers,
    };
  }
}
