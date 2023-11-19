import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/widget.dart';

import '../widget/list_colector_general_widget.dart';

class ColectorGeneral extends StatefulWidget {
  const ColectorGeneral(
      {Key? key,
      required this.adminId,
      required this.turn,
      required this.day,
      required this.month,
      required this.year})
      : super(key: key);
  final String adminId;
  final String turn;
  final int day;
  final int month;
  final int year;
  @override
  State<ColectorGeneral> createState() => _ColectorGeneralState();
}

class _ColectorGeneralState extends State<ColectorGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Colector General")),
      body: ListGeneralCollectorWidget(
              adminId: widget.adminId,
              turn: widget.turn,
              day: widget.day,
              month: widget.month,
              year: widget.year)
          .fadeAnimation(.5),
    );
  }
}
