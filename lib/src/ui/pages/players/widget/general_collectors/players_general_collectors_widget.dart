import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/state.dart';

import '../../../../../aplication/type_of_user.dart';
import '../../../../../data/services/get_it_mock.dart';
import '../../../../../data/util/util.dart';
import '../../../../../domain/all_players/entity/index.dart';
import '../../../../../infrastructure/player_all/datasources/implementation/player_all_repository.dart';
import '../../../login/loadin_screen.dart';
import '../../page/add_player/add_player_sm.dart';
import 'list_players_general_collectors.dart';

class PlayersGeneralCollectorsWidget extends StatefulWidget {
  const PlayersGeneralCollectorsWidget({Key? key}) : super(key: key);

  @override
  State<PlayersGeneralCollectorsWidget> createState() =>
      _PlayersGeneralCollectorsWidgetState();
}

class _PlayersGeneralCollectorsWidgetState
    extends State<PlayersGeneralCollectorsWidget> {
  bool canAddForPermit() {
    return GetItMock.manageGeneralCollectorsPermit() && canAddForParent();
  }

  bool canAddForParent() {
    String typeOfUser = GetItMock.typeOfUser();
    return typeOfUser == 'Admin';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: canAddForPermit()
          ? FloatingActionButton(
              onPressed: () {
                goAddNew(context);
              },
              backgroundColor: const Color.fromRGBO(152, 41, 33, 1),
              child: const Icon(
                Icons.add_reaction,
                color: Colors.white,
              ),
            )
          : Container(),
      body: const ListPlayersGeneralCollectors(),
    );
  }

  /// Desechado
  void _addUser(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        printS('connected');
        try {
          String typeOfUser = GetItMock.typeOfUser();
          if (typeOfUser == 'Admin') {
            LoadingScreen.show(context, "Cargando, por favor espere...");
            var players =
                await PlayerAllRepository().getPlayerAllEntitiesByAscendancy();
            LoadingScreen.hide(context);
            if (players['success'] != null) {
              var objPlayers = players['success'] as List<PlayerAbstractEntity>;
              // goAddNew(context, objPlayers);
              goAddNew(context);
            } else {
              alert(context, players['message']);
            }
          } else {
            goAddNew(context);
          }
        } catch (e) {
          printS("Error $e");
          LoadingScreen.hide(context);
          alert(context, "Revise su conexión a internet");
        }
      }
    } catch (e) {
      printS('not connected');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Revise su conexión a internet. Intente nuevamente..."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void goAddNew(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const AddPlayerPage(
                fromTabIndex: 1,
                editMode: false,
                // players: players,
                addPlayerType: TypeOfUser.generalcollector,
              )),
    );
  }
}
