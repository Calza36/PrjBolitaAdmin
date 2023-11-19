// To parse this JSON data, do
//
//     final fijoCorrido = fijoCorridoFromJson(jsonString);

// FijoCorrido fijoCorridoFromJson(String str) =>
//     FijoCorrido.fromJson(json.decode(str));
//
// String fijoCorridoToJson(FijoCorrido data) => json.encode(data.toJson());

class JugadasEnviadasModel {
  int number = 0;
  double fijo = 0.0;
  double corrido = 0.0;
  String type = "";
  double bet = 0.0;
  String numbers = "";
  int day = 0;
  int month = 0;
  int year = 2022;
  String session = "";

  JugadasEnviadasModel(this.number, this.fijo, this.corrido, this.type,
      this.bet, this.numbers, this.day, this.month, this.year, this.session);

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'fijo': fijo,
      'corrido': corrido,
      'type': type,
      'bet': bet,
      'numbers': numbers,
      'day': day,
      'month': month,
      'year': year,
      'session': session,
    };
  }
}
