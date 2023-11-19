import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/widget.dart';
import 'package:untitled/src/ui/pages/players/widget/collectors/players_collector_small_view_widget.dart';

import '../../../../../domain/player_collector/entity/index.dart';
import '../../../../../infrastructure/player_collector/datasources/implementation/player_collector_repository.dart';
import '../../../../widgets/plane_loading_widget.dart';

class ListPlayersCollectors extends StatefulWidget {
  const ListPlayersCollectors({Key? key}) : super(key: key);

  @override
  State<ListPlayersCollectors> createState() => _ListPlayersCollectorsState();
}

class _ListPlayersCollectorsState extends State<ListPlayersCollectors> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPlayerCollectorEntitiesByAscendancy(),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PlaneLoading(
            marginLeft: 0,
            marginRight: 0,
          );
        } else {
          if (snapshot.data['success'] != null) {
            var players =
                snapshot.data['success'] as List<PlayerCollectorEntity>;
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize:
                      const Size.fromHeight(30.0), // here the desired height
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    leadingWidth: 0,
                    leading: Container(),
                    title: Text("Total: ${players.length}"),
                  )),
              body: ListView.builder(
                itemCount: players.length + 1,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (BuildContext context, int index) {
                  return index < players.length
                      ? PlayerCollectorSmallView(
                          player: players[index],
                        ).fadeAnimation(.07)
                      : const SizedBox(height: 60);
                },
              ),
            );
          } else {
            return SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 200,
                        left: 20,
                      ),
                      child: Row(children: [
                        Center(
                          //child: Text("Tiempo de respuesta del servidor agotado.\nVerifique el acceso a Internet.")),
                          child: Text(snapshot.data['message'].toString()),
                        )
                        //ElevatedButton(onPressed: () {setState(() {});},child: Text("Reintentar"))
                      ])),
                ],
              ),
            );
          }
        }
      }),
    );
  }

  getPlayerCollectorEntitiesByAscendancy() {
    return PlayerCollectorRepository().getPlayerCollectorEntitiesByAscendancy();
  }
}
