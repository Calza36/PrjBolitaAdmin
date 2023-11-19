import 'package:flutter/material.dart';

import '../widget/list_bolas_limitadas_widget.dart';
import 'add_limites_page.dart';

class ProgramedLimits extends StatefulWidget {
  const ProgramedLimits({Key? key}) : super(key: key);

  @override
  State<ProgramedLimits> createState() => _ProgramedLimitsState();
}

class _ProgramedLimitsState extends State<ProgramedLimits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Limitados Programados"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goAddNew(context);
        },
        backgroundColor: const Color.fromRGBO(152, 41, 33, 1),
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.black,
        ),
      ),
      body: const ListBolasLimitadasWidget(),
    );
  }

  void goAddNew(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AddLimites()),
    );
  }
}
