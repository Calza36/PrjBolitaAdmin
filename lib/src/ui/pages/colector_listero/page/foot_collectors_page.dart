import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/widget.dart';

import '../widget/list_foot_collectors_widget.dart';

class FootCollectorsPage extends StatefulWidget {
  const FootCollectorsPage(
      {Key? key,
      required this.collectorId,
      required this.turn,
      required this.day,
      required this.month,
      required this.year})
      : super(key: key);
  final String collectorId;
  final String turn;
  final int day;
  final int month;
  final int year;
  @override
  State<FootCollectorsPage> createState() => _FootCollectorsPageState();
}

class _FootCollectorsPageState extends State<FootCollectorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Listeros")),
      body: ListFootCollectorsWidget(
              collectorId: widget.collectorId,
              turn: widget.turn,
              day: widget.day,
              month: widget.month,
              year: widget.year)
          .fadeAnimation(.5),
    );
  }
}
