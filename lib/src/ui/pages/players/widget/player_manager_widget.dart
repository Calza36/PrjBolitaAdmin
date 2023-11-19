import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/widget.dart';
import 'package:untitled/src/ui/pages/pages.dart';

import '../../../../aplication/type_of_user.dart';
import '../../../../data/util/util.dart';
import '../../../../domain/all_players/entity/index.dart';
import '../../../../infrastructure/player_all/datasources/implementation/player_all_repository.dart';
import '../../login/loadin_screen.dart';
import '../page/add_player/add_player_sm.dart';
import '../page/all_players/all_players.dart';
import '../page/collectors/collectors_players.dart';
import '../page/foot_collectors/foot_collectors_players.dart';
import '../page/general_collectors/general_collectors_players.dart';

class PlayerManageWidget extends StatelessWidget {
  PlayerManageWidget({super.key, required this.defaultTabIndex});
  int defaultTabIndex;
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const PlayersAll(),
      const PlayersGeneralCollectors(),
      const PlayersCollectors(),
      const PlayersFootCollectors(),
    ];
    final _kTabs = <Tab>[
      const Tab(text: 'Todos'),
      const Tab(text: 'C. General'),
      const Tab(text: 'Colector'),
      const Tab(text: 'Listeros'),
    ];
    printS("defaultTabIndex-> $defaultTabIndex");
    return DefaultTabController(
      initialIndex: defaultTabIndex,
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jugadores'),
          leading: GestureDetector(
            child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }),
          ),
          // If `TabController controller` is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          actions: const [
            // IconButton(
            //     onPressed: () {
            //       _addUser(
            //         context,
            //       );
            //     },
            //     icon: const Icon(Icons.add_reaction_outlined))
          ],
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }

  /// Desechado
  void _addUser(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          print('connected');
        }
        LoadingScreen.show(context, "Cargando, por favor espere...");
        try {
          var players =
              await PlayerAllRepository().getPlayerAllEntitiesByAscendancy();

          LoadingScreen.hide(context);
          if (players['success'] != null) {
            var objPlayers = players['success'] as List<PlayerAbstractEntity>;
            goAddNew(context, objPlayers);
          } else {
            alert(context, players['message']);
          }
        } catch (e) {
          printS("Error $e");
          LoadingScreen.hide(context);
          alert(context, "Revise su conexión a internet");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('not connected');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Revise su conexión a internet. Intente nuevamente..."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void goAddNew(BuildContext context, List<PlayerAbstractEntity> players) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const AddPlayerPage(
              fromTabIndex: 0,
              editMode: false,
              // players: players,
              addPlayerType: TypeOfUser.unselected)),
    );
  }
}
