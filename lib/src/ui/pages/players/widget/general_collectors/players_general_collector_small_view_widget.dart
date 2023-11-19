import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/src/data/services/get_it_mock.dart';
import 'package:untitled/src/ui/extencion/state.dart';

import '../../../../../data/util/util.dart';
import '../../../../../domain/player_general_collector/entity/index.dart';
import '../../../../../infrastructure/player_all/index.dart';
import '../../../../../infrastructure/player_foot_collector/datasources/implementation/player_foot_collector_repository.dart';
import '../../../login/loadin_screen.dart';
import '../../index.dart';
import '../../page/edit_player/edit_player_page.dart';

class PlayerGeneralCollectorSmallView extends StatefulWidget {
  const PlayerGeneralCollectorSmallView({super.key, required this.player});
  final PlayerGeneralCollectorEntity player;

  @override
  State<PlayerGeneralCollectorSmallView> createState() =>
      _PlayerGeneralCollectorSmallViewState();
}

class _PlayerGeneralCollectorSmallViewState
    extends State<PlayerGeneralCollectorSmallView> {
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
                  player.status.substring(0, 3),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              title: Text(
                player.name,
                style: const TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                'Regla: ${player.rule.name!}',
              ),
              trailing: GetItMock.manageGeneralCollectorsPermit()
                  ? SizedBox(
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
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      title: const Text(
                                        "Eliminar Jugador",
                                      ),
                                      content: Text(
                                        "Desea eliminar a jugador: ${player.name}",
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
                    )
                  : Container(),
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
                fromTab: 1,
                typePlayer: player,
              )),
    );
  }

  void _editUser(context, player) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        LoadingScreen.show(context, "Cargando, por favor espere...");
        try {
          var player = await PlayerProvider().getPlayer(widget.player.id);
          popFrom(context);
          goEdit(context, player);
        } catch (e) {
          print("Error $e");
          LoadingScreen.hide(context);
          alert(context, "Revise su conexión a internet");
        }
      }
    } catch (e) {
      print('not connected');
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
                            defaultTabIndex: 1,
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
