class LimitatedEntity {
  String id;
  bool isActive;
  List<String>? numbers;
  List<String>? parlets;
  int? day;
  int? month;
  String? turn;
  int? year;

  LimitatedEntity(this.id, this.isActive, this.numbers, this.parlets, this.day,
      this.month, this.turn, this.year);
}
