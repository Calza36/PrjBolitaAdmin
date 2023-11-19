import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/state.dart';
import 'package:untitled/src/ui/extencion/widget.dart';

import '../../../../../aplication/type_of_user.dart';
import '../../../../../data/util/util.dart';
import '../../../../../domain/all_players/entity/index.dart';
import '../../../../../infrastructure/player_all/datasources/implementation/player_all_repository.dart';
import '../../../login/loadin_screen.dart';
import '../../page/add_player/add_player_sm.dart';
import '../../page/edit_player/edit_player_page.dart';
import 'list_all_players_widget.dart';

class AllPlayersWidget extends StatefulWidget {
  const AllPlayersWidget({super.key});

  @override
  State<AllPlayersWidget> createState() => _AllPlayersWidgetState();
}

class _AllPlayersWidgetState extends State<AllPlayersWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _addUser(
      //       context,
      //     );
      //   },
      //   backgroundColor: const Color.fromRGBO(152, 41, 33, 1),
      //   child: const Icon(
      //     Icons.add_reaction,
      //     color: Colors.white,
      //   ),
      // ),
      body: const ListAllPlayersWidget().fadeAnimation(.3),
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
                //  players: players,
                addPlayerType: TypeOfUser.unselected,
              )),
    );
  }

  void goEdit(
    BuildContext context,
    player,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => EditPlayerPage(
                fromTab: 0,
                typePlayer: player,
              )),
    );
  }
}
