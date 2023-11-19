import 'package:flutter/material.dart';

import '../../pages.dart';
import '../widget/form_add_limites_widget.dart';

class AddLimites extends StatelessWidget {
  const AddLimites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProgramedLimits()),
              );
            },
            child: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: const Text("Adicionar limitados"),
        ),
        body: const FormAddLimitesWidget());
  }
}
