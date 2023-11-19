class FootCollectorReportEntity {
  String id;
  int clean;
  int prize;
  int wins;
  int loses;
  String? name;

  FootCollectorReportEntity(
    this.id,
    this.clean,
    this.prize,
    this.wins,
    this.loses, {
    this.name = '',
  });
}
