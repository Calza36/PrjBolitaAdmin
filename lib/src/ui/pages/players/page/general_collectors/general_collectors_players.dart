import 'package:flutter/material.dart';

import '../../widget/general_collectors/players_general_collectors_widget.dart';

class PlayersGeneralCollectors extends StatelessWidget {
  const PlayersGeneralCollectors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PlayersGeneralCollectorsWidget(),
    );
  }
}
