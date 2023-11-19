import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/state.dart';

import '../../../../data/util/util.dart';
import '../../../../domain/all_players/entity/index.dart';
import '../../../../infrastructure/player_all/index.dart';
import '../../../../infrastructure/player_foot_collector/datasources/implementation/player_foot_collector_repository.dart';
import '../../login/loadin_screen.dart';
import '../index.dart';
import '../page/edit_player/edit_player_page.dart';

class ManagePanelWidget extends StatefulWidget {
  const ManagePanelWidget({Key? key, required this.player}) : super(key: key);

  final PlayerAbstractEntity player;

  @override
  State<ManagePanelWidget> createState() => _ManagePanelWidgetState();
}

class _ManagePanelWidgetState extends State<ManagePanelWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _deleteUser(context, widget.player),
            child: const Icon(Icons.delete_forever, size: 35),
          ),
          GestureDetector(
            onTap: () => _editUser(context, widget.player),
            child: const Icon(Icons.edit_outlined, size: 35),
          )
        ],
      ),
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

  void _editUser(context, player) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          print('connected');
        }
        LoadingScreen.show(context, "Cargando, por favor espere...");
        try {
          var player = await PlayerProvider().getPlayer(widget.player.idPlayer);
          popFrom(context);
          goEdit(context, player);
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

  void _deleteUser(context, PlayerAbstractEntity player) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        printS('connected');
        LoadingScreen.show(context, "Eliminando usuario, por favor espere...");
        try {
          Map info = await PlayerFootCollectorRepository()
              .deletePlayer(player.idPlayer);
          LoadingScreen.hide(context);
          printS("INFO: $info");
          if ((info['error'] != null) || info['ok'] != null) {
            if (info['ok'] != null) {
              if (info['ok'] as bool) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlayersDashboard(
                            defaultTabIndex: 0,
                          )),
                );
                showInfo(context, "Usuario ${player.namePlayer} eliminado.");
              } else {
                printS("Error");
                alert(
                    context, 'Error al intentar eliminar. ${info['message']}');
              }
            } else if (info['error'] != null) {
              setState(() {
                LoadingScreen.hide(context);
              });
              alert(context, "Revise su conexión a internet");
            }
          }
        } catch (e) {
          printS("Error $e");
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
}
