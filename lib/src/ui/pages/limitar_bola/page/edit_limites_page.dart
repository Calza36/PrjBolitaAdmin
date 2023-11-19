import 'package:flutter/material.dart';
import 'package:untitled/src/domain/limitation_queue/entity/limitation_queue_entity.dart';

import '../../pages.dart';
import '../widget/form_edit_limites_widget.dart';

class EditLimites extends StatelessWidget {
  const EditLimites({super.key, required this.limitatedEntity});
  final LimitatedEntity limitatedEntity;
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
          title: const Text("Editar limitados"),
        ),
        body: FormEditLimitesWidget(
          limitatedEntity: limitatedEntity,
        ));
  }
}
