class ParleObtainModel {
  double idem_pk;
  double bet;
  double price;
  int number1;
  int number2;

  ParleObtainModel({
    this.idem_pk = 0,
    this.bet = 0,
    this.price = 0,
    this.number1 = 0,
    this.number2 = 0,
  });

  factory ParleObtainModel.fromJson(Map<String, dynamic> json) => ParleObtainModel(
        idem_pk: json["idem_pk"],
        bet: json["bet"],
        price: json["price"],
        number1: json["number1"],
        number2: json["number2"],
  );

  Map<String, dynamic> toJson() => {
        "idem_pk": idem_pk,
        "bet": bet,
        "price": price,
        "number1": number1,
        "number2": number2,
      };
}