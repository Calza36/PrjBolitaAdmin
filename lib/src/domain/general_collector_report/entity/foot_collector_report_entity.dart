class GeneralCollectorReportEntity {
  String id;
  int clean;
  int prize;
  int wins;
  int loses;
  int salary;
  String? name;

  GeneralCollectorReportEntity(
    this.id,
    this.clean,
    this.prize,
    this.wins,
    this.loses,
    this.salary, {
    this.name = '',
  });
}
