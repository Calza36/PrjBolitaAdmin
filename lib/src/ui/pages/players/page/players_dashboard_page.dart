import 'package:flutter/material.dart';

import '../../home/home_page.dart';
import '../index.dart';

class PlayersDashboard extends StatefulWidget {
  const PlayersDashboard({super.key, required this.defaultTabIndex});

  final int defaultTabIndex;

  @override
  State<PlayersDashboard> createState() => _PlayersDashboardState();
}

class _PlayersDashboardState extends State<PlayersDashboard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Impedir que el botón de retroceso cierre la pantalla
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (Route<dynamic> route) => false,
          );
          return false;
        },
        child: PlayerManageWidget(
          defaultTabIndex: widget.defaultTabIndex,
        ));
  }
}
