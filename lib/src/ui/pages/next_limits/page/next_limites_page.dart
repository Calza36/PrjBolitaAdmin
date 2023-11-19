import 'package:flutter/material.dart';

import '../widget/next_limits_view_widget.dart';

class NextLimits extends StatefulWidget {
  const NextLimits({super.key});

  @override
  State<NextLimits> createState() => _NextLimitsState();
}

class _NextLimitsState extends State<NextLimits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Limitados para Mañana"),
      ),
      body: const NextLimitsViewWidget(),
    );
  }
}
