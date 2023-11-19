import 'package:flutter/material.dart';

import '../widget/current_limits_view_widget.dart';

class CurrentLimits extends StatefulWidget {
  const CurrentLimits({super.key});

  @override
  State<CurrentLimits> createState() => _CurrentLimitsState();
}

class _CurrentLimitsState extends State<CurrentLimits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Limitados Actuales"),
      ),
      body: const CurrentLimitsViewWidget(

      ),
    );
  }
/*
  void goAddNew(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AddLimites()),
    );
  }

  seeProgramedLimits(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProgramedLimits()));
  }*/
}
