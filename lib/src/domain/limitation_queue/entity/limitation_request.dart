class LimitationRequestEntity {
  LimitationRequestEntity({
    this.id,
    required this.turn,
    required this.day,
    required this.month,
    required this.year,
    required this.numberDay,
    required this.parletDay,
    required this.numberNight,
    required this.parletNight,
  });
  String? id;
  String turn;
  int day;
  int month;
  int year;
  List<String> numberDay;
  List<String> parletDay;
  List<String> numberNight;
  List<String> parletNight;
}
