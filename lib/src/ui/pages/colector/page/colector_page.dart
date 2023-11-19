import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/widget.dart';

import '../widget/list_colectores_widget_v2.dart';

class ColectorPage extends StatefulWidget {
  const ColectorPage(
      {super.key,
      required this.generalCollectorId,
      required this.turn,
      required this.day,
      required this.month,
      required this.year});
  final String generalCollectorId;
  final String turn;
  final int day;
  final int month;
  final int year;

  @override
  State<ColectorPage> createState() => _ColectorPageState();
}

class _ColectorPageState extends State<ColectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Colector")),
      body: ListColectoresWidgetV2(
              generalCollectorId: widget.generalCollectorId,
              turn: widget.turn,
              day: widget.day,
              month: widget.month,
              year: widget.year)
          .fadeAnimation(.5),
    );
  }
}
