class CentenaObtainModel {
  double idem_pk;
  double bet;
  double price;
  int number;

  CentenaObtainModel({
    this.idem_pk = 0,
    this.bet = 0,
    this.price = 0,
    this.number = 0,
  });

  factory CentenaObtainModel.fromJson(Map<String, dynamic> json) => CentenaObtainModel(
        idem_pk: json["idem_pk"],
        bet: json["bet"],
        price: json["price"],
        number: json["number"],
  );

  Map<String, dynamic> toJson() => {
        "idem_pk": idem_pk,
        "bet": bet,
        "price": price,
        "number": number,
      };
}