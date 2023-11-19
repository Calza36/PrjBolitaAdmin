class FijoCorridoObtainModel {
  List<double> idem_pk;
  List<int> number;
  List<double> corrido;
  List<double> fijo;
  List<double> fijo_price;
  List<double> corrido_price;

  FijoCorridoObtainModel({
    required this.idem_pk,
    required this.number,
    required this.corrido,
    required this.fijo,
    required this.fijo_price,
    required this.corrido_price,
  });

  factory FijoCorridoObtainModel.fromJson(dynamic json) {
    return FijoCorridoObtainModel(idem_pk: json["idem_pk"], number: json["number"], corrido: json["corrido"], fijo: json["fijo"], fijo_price: json["fijo_price"], corrido_price: json["corrido_price"]);
  }

  @override
  String toString() {
    return '{ $number, $fijo }';
  }
  // factory FijoCorridoObtainModel.fromJson(Map<String, dynamic> json) => FijoCorridoObtainModel(
  //       idem_pk: json["idem_pk"],
  //       number: json["number"],
  //       corrido: json["corrido"],
  //       fijo: json["fijo"],
  //       fijo_price: json["fijo_price"],
  //       corrido_price: json["corrido_price"],
  // );

  Map<String, dynamic> toJson() => {
        "idem_pk": idem_pk,
        "number": number,
        "corrido": corrido,
        "fijo": fijo,
        "fijo_price": fijo_price,
        "corrido_price": corrido_price,
      };
}