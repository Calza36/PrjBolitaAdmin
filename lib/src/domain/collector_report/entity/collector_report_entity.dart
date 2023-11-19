class CollectorReportEntity {
  String id;
  int clean;
  int prize;
  int wins;
  int loses;
  int salary;
  String? name;

  CollectorReportEntity(
    this.id,
    this.clean,
    this.prize,
    this.wins,
    this.loses,
    this.salary, {
    this.name = '',
  });
}
