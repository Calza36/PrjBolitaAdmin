import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/state.dart';

import '../../../../../data/util/util.dart';
import '../../../../../domain/all_players/entity/index.dart';
import '../../../../../infrastructure/player_all/index.dart';
import '../../../../../infrastructure/player_foot_collector/datasources/implementation/player_foot_collector_repository.dart';
import '../../../login/loadin_screen.dart';
import '../../index.dart';
import '../../page/edit_player/edit_player_page.dart';

class PlayerAllSmallView extends StatefulWidget {
  const PlayerAllSmallView({super.key, required this.player});
  final PlayerAbstractEntity player;

  @override
  State<PlayerAllSmallView> createState() => _PlayerAllSmallViewState();
}

class _PlayerAllSmallViewState extends State<PlayerAllSmallView> {
  @override
  Widget build(BuildContext context) {
    final player = widget.player;
    return Card(
        elevation: 2,
        child: SizedBox(
          height: 80,
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: const Color.fromRGBO(152, 41, 33, 1),
                child: Text(
                  player.estado.substring(0, 3),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              title: Text(
                player.namePlayer,
                style: const TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                'Regla: ${player.nameRegla}',
              ),
              trailing: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                title: const Text(
                                  "Eliminar Jugador",
                                ),
                                content: Text(
                                  "Desea eliminar a jugador: ${player.namePlayer}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text(
                                        'Cancelar',
                                      )),
                                  ElevatedButton(
                                    onPressed: () {
                                      _deleteUser(context, player);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        textStyle: const TextStyle(
                                            color: Colors.green)),
                                    child: const Text('Aceptar'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Icon(Icons.delete_forever, size: 35),
                    ),
                    GestureDetector(
                      onTap: () {
                        _editUser(context, player);
                      },
                      child: const Icon(Icons.edit_outlined, size: 35),
                    )
                  ],
                ),
              ),
              iconColor: Colors.black,
            ),
          ),
        ));
  }

  void goEdit(
    BuildContext context,
    player,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => EditPlayerPage(
                fromTab: 3,
                typePlayer: player,
              )),
    );
  }

  void _editUser(context, player) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        printS('connected');
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
      printS('not connected');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Revise su conexión a internet. Intente nuevamente..."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _deleteUser(context, player) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        printS('connected');
        LoadingScreen.show(context, "Eliminando usuario, por favor espere...");
        try {
          Map info =
              await PlayerFootCollectorRepository().deletePlayer(player.id);
          LoadingScreen.hide(context);
          printS("INFO: $info");
          if ((info['error'] != null) || info['ok'] != null) {
            if (info['ok'] != null) {
              if (info['ok'] as bool) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlayersDashboard(
                            defaultTabIndex: 3,
                          )),
                );
                showInfo(context, "Usuario eliminado.");
              } else {
                popFrom(context);
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
