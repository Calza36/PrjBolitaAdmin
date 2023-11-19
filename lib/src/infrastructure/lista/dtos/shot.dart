class Shot {
  Shot({
    this.pick3,
    this.pick4,
  });

  factory Shot.fromJson(Map<String, dynamic> json) => Shot(
        pick3: json['pick3'],
        pick4: json['pick4'],
      );

  String? pick3;
  String? pick4;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pick3'] = pick3;
    map['pick4'] = pick4;
    return map;
  }
}
