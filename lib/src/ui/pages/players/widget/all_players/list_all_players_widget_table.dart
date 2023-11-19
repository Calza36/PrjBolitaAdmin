import 'package:flutter/material.dart';

import '../../../../../domain/all_players/entity/index.dart';
import '../../../../../infrastructure/player_all/datasources/implementation/player_all_repository.dart';
import '../../../../widgets/plane_loading_widget.dart';
import '../manage_panel_widget.dart';

// Adapted from the data table demo in offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/data_table_demo.dart
class ListAllPlayersWidget extends StatefulWidget {
  const ListAllPlayersWidget({super.key});

  @override
  ListAllPlayersWidgetState createState() => ListAllPlayersWidgetState();
}

class ListAllPlayersWidgetState extends State<ListAllPlayersWidget> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPlayerAllEntitiesByAscendancy(),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PlaneLoading(
            marginLeft: 0,
            marginRight: 0,
          );
        } else {
          if (snapshot.data['success'] != null) {
            var players =
                snapshot.data['success'] as List<PlayerAbstractEntity>;
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
                body: SingleChildScrollView(
                  child: PaginatedDataTable(
                    //header: const Text('Total: '),
                    columnSpacing: 18,
                    rowsPerPage: _rowsPerPage,
                    availableRowsPerPage: const <int>[5, 10, 15, 20],
                    onRowsPerPageChanged: (int? value) {
                      if (value != null) {
                        setState(() => _rowsPerPage = value);
                      }
                    },
                    columns: kTableColumns,
                    source: PlayerDataSource(players),
                  ),
                ));
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

  Future<Map<String, dynamic>> getPlayerAllEntitiesByAscendancy() {
    return PlayerAllRepository().getPlayerAllEntitiesByAscendancy();
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
      label: Text('Jugador'), tooltip: 'Nombre del jugador.', numeric: false),
  DataColumn(
    label: Text('Regla'),
    tooltip: 'Define parámetros generales o específicos para los jugadores.',
    numeric: false,
  ),
  DataColumn(
    label: Text('Estado'),
    tooltip: 'Estado del jugador. [Inicial, Activo, Bloqueado...]',
    numeric: true,
  ),
  DataColumn(
    label: Text('Administrar'),
    numeric: false,
  ),
];

////// Data source class for obtaining row data for PaginatedDataTable.
class PlayerDataSource extends DataTableSource {
  List<PlayerAbstractEntity> players = <PlayerAbstractEntity>[];

  PlayerDataSource(this.players);
  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= players.length) return null;
    final PlayerAbstractEntity player = players[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(player.namePlayer)),
        DataCell(Text(player.nameRegla.toString())),
        DataCell(Text(player.estado)),
        DataCell(ManagePanelWidget(
          player: player,
        )),
      ],
    );
  }

  @override
  int get rowCount => players.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
