import 'package:flutter/material.dart';

import '../../widget/all_players/all_players_widget.dart';

class PlayersAll extends StatelessWidget {
  const PlayersAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AllPlayersWidget(),
    );
  }
}
